class Scale
  include Terms
  attr_reader :mode

  def initialize(pitch, mode)
    @pitch = pitch
    @mode = mode
  end

  def scale
    arr = pc_scale
    if @pitch.pitch_name.include?("b") || @pitch.pitch_name.eql?("F")
      notes = %w[C Db D Eb E F Gb G Ab A Bb ]
    else
      notes = %w[C C# D D# E F F# G G# A A# B]
    end
    arr.map do |n|
      notes[n].to_s
    end
  end

  # returns an array of pitch classes in ascending scale order
  def pc_scale
    temp = major_scale
    modal = {
      ionian: 0,
      dorian: 1,
      phrygian: 2,
      lydian: 3,
      mixolydian: 4,
      aeolian: 5,
      locrian: 6
    }
    temp.rotate modal[@mode.to_sym]

  end

  private

  # method for finding tonic note of other modes
  def tonic
    modal = {
      ionian: 0,
      dorian: 2,
      phrygian: 4,
      lydian: 5,
      mixolydian: 7,
      aeolian: 9,
      locrian: 11
    }
    (@pitch.pitch_class - modal[@mode.to_sym]) % 12
  end

  # returns an array of pitch classes as a major scale
  def major_scale
    helper = -> (n, arr, acc) do
      if acc == 7
        arr
      elsif acc == 2
        helper.call((n + 1) % 12, arr + [n % 12], acc + 1)
      else
        helper.call((n + 2) % 12, arr + [n % 12], acc + 1)
      end
    end
    helper.call(tonic, [], 0)
  end
end
