xml.instruct!
xml.Response do
  xml.Say "Welcome to Faith Comes by Hearing. I'm going to hangup and call back to make this a free call for you."
  xml.Redirect phone_call_back_url
end