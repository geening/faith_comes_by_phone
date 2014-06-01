xml.instruct!
xml.Response do
  split_long_sms_message(@message).each do |message|
    xml.Sms message
  end
end