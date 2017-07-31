include Java

MidiSystem = javax.sound.midi.MidiSystem
ShortMsg = javax.sound.midi.ShortMessage

def device
 MidiSystem.get_midi_device_info.select {|x| x.get_name.eql? "Gervill"}.first
end

dv = MidiSystem.get_midi_device(device)
dv.open
rec = dv.get_receiver

#duration is needed, volume

def play_notes arr, rec
  arr.each do |note|
    toggle = ShortMsg.new
    toggle.set_message(ShortMsg::NOTE_ON, 0, note, 100)
    rec.send(toggle, 0)
    sleep (rand + 0.125)
    toggle.set_message(ShortMsg::NOTE_OFF, 0, note, 100)
    rec.send(toggle, 0)
  end
  sleep 0.5
end

play_notes [81, 42, 83, 52, 75, 37, 68, 40, 59, 48, 62, 45, 65, 43], rec
