class MidiInterval < Interval
  include Terms
  attr_reader :midi, :midi2

  def initialize(pitch = Pitch.new, pitch2 = Pitch.new)
    super
    @midi = MidiCalc.new(pitch)
    @midi2 = MidiCalc.new(pitch2)
  end

  def midi_pitch
    midi.pc_to_midi
  end

  def midi_pitch2
    midi2.pc_to_midi
  end
end
