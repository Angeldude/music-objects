require './lib/pitches'
require './java_sound'

def set_add(set, set2)
  (set | set2) - (set & set2)
end

# f = Pitch.new('b', 4)
# d = Pitch.new('g#', 1)
# i = Interval.new(f, d)
# mi = MidiInterval.new(f, d)
# mc = MidiCalc.new(f)

s = Scale.new(Pitch.new('c#'), 'ionian')
s1 = Scale.new(Pitch.new('g'), 'phrygian')
s2 = Scale.new(Pitch.new('f#'), 'dorian')
s3 = Scale.new(Pitch.new('d'), 'locrian')
s4 = Scale.new(Pitch.new('a'), 'aeolian')
s5 = Scale.new(Pitch.new('b'), 'mixolydian')


# p i.ordered_pi == -39
# p i.unordered_pi == 39
# p i.ordered_pc_interval == 9
# p i.interval_class == 3

# p s.scale
# p s1.scale
# p set_add(s.pc_scale, s1.pc_scale)

def melody scales
  oct = rand(4) + 2
  scales.scale.map {|note|
    MidiCalc.new(Pitch.new(note, oct)).pc_to_midi
  }.shuffle
end

def repeat mel, num
  arr = []
  num.times do
  arr += melody(mel)
  end
  arr
end

puts "Random melody..."
play_notes(repeat(s1, 30), @rec)
