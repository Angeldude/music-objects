require './lib/pitches'

def set_add(set, set2)
  (set | set2) - (set & set2)
end

f = Pitch.new('b', 4)
d = Pitch.new('g#', 1)
i = Interval.new(f, d)
mi = MidiInterval.new(f, d)
mc = MidiCalc.new(f)

s = Scale.new(Pitch.new('c'), 'ionian')
s1 = Scale.new(Pitch.new('f#'), 'dorian')
p s.pc_scale
p s.scale

p i.ordered_pi == -39
p i.unordered_pi == 39
p i.ordered_pc_interval == 9
p i.interval_class == 3

p s.pc_scale
p s1.pc_scale
p set_add(s.pc_scale, s1.pc_scale)

p s1.scale.map {|note|
  MidiCalc.new(Pitch.new(note)).pc_to_midi
}
