class MidiCalc
  include Terms
  attr_reader :name, :otva

  # initialize with Pitch object
  def initialize(pitch)
    @pitch_class = pitch.pitch_class
    # octave must be offset
    @otva = pitch.octave + 1
    @name = pitch.to_s
  end

  def to_s
    "#{name}"
  end

  def pc_to_midi
    (SEMI * @otva) + @pitch_class
  end

  def midi_to_pc
    @pitch_class
  end

  def mtof # midi to frequency standard formula
    TUNING_PITCH * (OCTAVE**((pc_to_midi - MIDI_BASE) / SEMI.to_f))
  end
end
