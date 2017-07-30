require './lib/pitches'

f = Pitch.new('b', 4)
d = Pitch.new('g#', 1)
i = Interval.new(f, d)
mi = MidiInterval.new(f, d)
mc = MidiCalc.new(f)


s = Scale.new(f, 'ionian')
p s.pc_scale

p i.ordered_pi
p i.unordered_pi
p i.ordered_pc_interval
p i.interval_class
