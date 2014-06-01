xml.instruct!
xml.Response do
  xml.Gather action: phone_play_audio_url do
    xml.Say "To continue, press any key followed by the pound sign."
    xml.Pause length:5
  end
  xml.Say "We didn't receive any input. Goodbye!"
end