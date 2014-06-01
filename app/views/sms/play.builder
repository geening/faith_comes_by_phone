xml.instruct!
xml.Response do
  xml.Say "Welcome to Faith Comes by Hearing"
  xml.Play @url
  xml.Redirect phone_play_next_audio_url
end