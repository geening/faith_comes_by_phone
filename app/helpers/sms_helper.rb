module SmsHelper
  # returns array of 160 char messages
  def split_long_sms_message(message)
    message.scan(/.{1,160}/)
  end
end
