require 'json'

unless ARGV.size == 4
  puts 'Error: Set just 4 args -> input file, output file, key, name'
  exit!
end

hashmap_array = nil

File.open(ARGV[0]) do |file|
  hashmap_array = JSON.load(file)
end

hashmap_array.select! { |hashmap| hashmap[ARGV[2]] == ARGV[3] }

File.open(ARGV[1], 'w') do |file|
  file.puts(JSON.pretty_generate(hashmap_array))
end
