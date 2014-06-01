class PhoneController < ApplicationController
  before_filter :twilio_adapter
  before_filter :find_language
  
  def call
    
  end

  def sms 
    @user = User.where(phone_number: @phone_number, language:@language).first_or_create!
    @user.touch(:last_sms_at)
    
    text_back " Line 1\r*Line 2\rLine 3"
    
    # respond_to do |format|
    #   if @question.save
    #     format.html   { render text: 'Thanks! Your question has been submitted.' }
    #     format.json   { render json: "Thanks! Your question has been submitted.", status: :created }
    #     format.twilio { text_back "Thanks for your question!" }
    #   else
    #     format.html   { render action: "new" }
    #     format.json   { render json: @question.errors, status: :unprocessable_entity }
    #     format.twilio { text_back "Sorry, there was a problem receiving your question. Please try again" }
    #   end
    # end
  end
  
private

  def find_language
    @language = Language.where(twilio_phone_number:params['To']).first
  end

  def twilio_adapter
    @country        = params['FromCountry'] if params['FromCountry']
    @text           = params['Body']        if params['Body'] 
    @phone_number   = params['From']        if params['From']
  end

  def text_back( message )
    @message = message
    render 'sms/response'
  end
  
  # Example: {"ToCountry"=>"US", "ToState"=>"CA", "SmsMessageSid"=>"SMe23040ec9de03e3d3f4890f9cdad64d3", "NumMedia"=>"0", "ToCity"=>"SAUSALITO", "FromZip"=>"94108", "SmsSid"=>"SMe23040ec9de03e3d3f4890f9cdad64d3", "FromState"=>"CA", "SmsStatus"=>"received", "FromCity"=>"SAN FRANCISCO", "Body"=>"Hey hey", "FromCountry"=>"US", "To"=>"+14153674222", "ToZip"=>"94965", "MessageSid"=>"SMe23040ec9de03e3d3f4890f9cdad64d3", "AccountSid"=>"AC5381686daf0f4c979304e16c92dc8c35", "From"=>"+14156581081", "ApiVersion"=>"2010-04-01"}
  
end
