require 'json'

unless ARGV.size == 4
  puts 'Error: Set just 4 args -> input file, output file, key, name'
  exit!
end

hash_map = nil

File.open(ARGV[0]) do |file|
  hash_map = JSON.load(file)
end

hash_map = hash_map.select { |entry| entry[ARGV[2]] == ARGV[3] }

File.open(ARGV[1], 'w') do |file|
  file.puts(JSON.pretty_generate(hash_map))
end
