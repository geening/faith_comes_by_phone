class PhoneController < ApplicationController
  before_filter :twilio_adapter, :set_language, :set_user
  
  def sms 
    @user.touch(:last_sms_at)
    case @text.strip
    when '?' then text_back sms_menu
    when /^\d+$/ then 'Bookmark Moved'
    else
      book, chapter = Bible::Book.parse_str(@text.strip)
      
      begin
        if _book = Bible::Book.from_vauge_name(book).first
          @user.update_attributes({
            current_book: _book,
            current_chapter: chapter
          }) && call_user
        else
          raise "Text Parse Error"
        end
      rescue
        text_back "Couldn't read that. Please check the spelling"
      end
    end
  end
  
  def call
    render 'sms/call_back'
    @user.touch(:last_call_at)
  end
  
  def call_back
    render 'sms/empty'
  end
  
  def play_audio
    play @user.current_book.url(@user.current_chapter)
  end
  
  def play_next_audio
    @user.next_chapter!  #Fix the ALWAYS advancing chapter... it should only advance when gated
    render 'sms/continue_check'
  end
  
private
  def text_back( message )
    @message = message
    render 'sms/response'
  end
  
  def call_user
    @client = Twilio::REST::Client.new AppConfig.twilio.sid, AppConfig.twilio.token
    @call = @client.account.calls.create(
      from: @language.twilio_phone_number,
      to:   @user.phone_number,
      url:  phone_play_audio_url,
      'IfMachine'=>'hangup')
  end

  def play(url)
    @url = url
    render 'sms/play'
  end
  
  def set_user
    @user = User.where(phone_number: @phone_number, language_id:@language.id).first_or_create!
  end
  
  def set_language
    @language = Language.where(twilio_phone_number:@twilio_phone_number).first
  end

  def twilio_adapter
    @country             = params['FromCountry'] if params['FromCountry']
    @text                = params['Body']        if params['Body'] 
    
    if params['Direction']=='outbound-api'
      @phone_number        = params['To']
      @twilio_phone_number = params['From']
    else
      @phone_number        = params['From']
      @twilio_phone_number = params['To']
    end
  end
  
  def sms_menu
    current_book = @user.current_book
    current_chapter = @user.current_chapter
    
    menu = if current_chapter < 3
      [
        "=> #{current_book.name} #{current_chapter}",
        "2) #{current_book.name} #{current_chapter+1}",
        "3) #{current_book.name} #{current_chapter+2}",
        "4) #{current_book.name} #{current_chapter+3}",
        "5) #{current_book.name} #{current_chapter+4}",
      ].join("\r")
    
    elsif current_chapter+2 > current_book.chapter_count  #end of book
      [
        "1) #{current_book.name} #{current_chapter-4}",
        "2) #{current_book.name} #{current_chapter-3}",
        "3) #{current_book.name} #{current_chapter-2}",
        "4) #{current_book.name} #{current_chapter-1}",
        "=> #{current_book.name} #{current_chapter}",
      ].join("\r")
      
    else # Happy Path
      [
        "1) #{current_book.name} #{current_chapter-2}",
        "2) #{current_book.name} #{current_chapter-1}",
        "=> #{current_book.name} #{current_chapter}",
        "4) #{current_book.name} #{current_chapter+1}",
        "5) #{current_book.name} #{current_chapter+2}",
      ].join("\r")
      
      
    end
    
    "Move Your Bookmark:\r#{menu}"
  end
  
  # Example: {"ToCountry"=>"US", "ToState"=>"CA", "SmsMessageSid"=>"SMe23040ec9de03e3d3f4890f9cdad64d3", "NumMedia"=>"0", "ToCity"=>"SAUSALITO", "FromZip"=>"94108", "SmsSid"=>"SMe23040ec9de03e3d3f4890f9cdad64d3", "FromState"=>"CA", "SmsStatus"=>"received", "FromCity"=>"SAN FRANCISCO", "Body"=>"Hey hey", "FromCountry"=>"US", "To"=>"+14153674222", "ToZip"=>"94965", "MessageSid"=>"SMe23040ec9de03e3d3f4890f9cdad64d3", "AccountSid"=>"AC5381686daf0f4c979304e16c92dc8c35", "From"=>"+14156581081", "ApiVersion"=>"2010-04-01"}
  
end
