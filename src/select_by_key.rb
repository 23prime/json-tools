require 'json'

if ARGV.size < 4
  puts 'Error: Set over 3 args -> input file, output file, key1, key2, ...'
  exit!
end

hashmap_array = nil

File.open(ARGV[0]) do |file|
  hashmap_array = JSON.load(file)
end

hashmap_array.map! { |hashmap| hashmap.select { |key, _| ARGV[2..].include?(key) } }

File.open(ARGV[1], 'w') do |file|
  file.puts(JSON.pretty_generate(hashmap_array))
end
