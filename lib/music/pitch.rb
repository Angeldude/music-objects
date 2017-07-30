class Pitch
  include Terms

  attr_reader :pitch_class, :pitch_name, :octave

  def initialize(pitch = 'c', octave = 4)
    @pitch_name = pitch.capitalize
    @octave = octave
    @pitch_class = PITCHES[pitch.capitalize.to_sym]
  end

  def to_s
    "#{pitch_name}#{octave}"
  end
end
