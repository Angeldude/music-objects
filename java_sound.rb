include Java

MidiSystem = javax.sound.midi.MidiSystem
ShortMsg = javax.sound.midi.ShortMessage

@fluid = "FluidSynth virtual port (37884)"
@gervill = "Gervill"

def device
 MidiSystem.get_midi_device_info[1]#.select {|x| x.get_name.eql? @fluid}.first
end

dv = MidiSystem.get_midi_device(device)
dv.open
@rec = dv.get_receiver

#duration is needed, volume
def duration d
  f = rand
  dur = rand + 0.05
  if f > 0.3
    d
  else
    dur
  end
end

def play_notes arr, rec
  d = 0.17
  arr.each do |note|
    toggle = ShortMsg.new
    toggle.set_message(ShortMsg::NOTE_ON, 0, note, (rand(98)+25))
    rec.send(toggle, 0)
    sleep duration(d)
    toggle.set_message(ShortMsg::NOTE_OFF, 0, note, 100)
    rec.send(toggle, 0)
  end
  sleep 0.5
end
