%w[music_terms pitch interval scale midi_interval midi_calc].each do |item|
  require_relative "music/#{item}"
end
