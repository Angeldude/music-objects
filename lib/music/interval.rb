class Interval
  include Terms

  attr_reader :pitch, :pitch2
  # accepts pitches only
  def initialize(pitch = Pitch.new, pitch_2 = Pitch.new)
    @pitch = pitch
    @pitch2 = pitch_2
  end

  def to_s
    "#{pitch} to #{pitch2}"
  end

  def ordered_pi
    (@pitch2.octave * SEMI + pitch2.pitch_class) - (@pitch.octave * SEMI + pitch.pitch_class)
  end

  def unordered_pi
    ordered_pi.abs
  end

  def ordered_pc_interval
    (pitch2.pitch_class - pitch.pitch_class) % SEMI
  end

  def interval_class
    [ordered_pc_interval, (pitch.pitch_class- pitch2.pitch_class) % SEMI].min
  end
end
