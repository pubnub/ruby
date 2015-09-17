puts "Working..."

fixtures_path = "/Users/blazeroot/Projects/pubnub-ruby/fixtures/vcr_cassettes/test_examples/"
tests_path = "/Users/blazeroot/Projects/pubnub-ruby/spec/examples/"

i = 1000000

Dir.glob(fixtures_path + "*").sort.each do |f|
  filename = File.basename(f, File.extname(f))
  File.rename(f, fixtures_path + i.to_s + File.extname(f))
  Dir.glob(tests_path + "*").sort.each do |test_file_name|
    text = File.read(test_file_name)
    new_contents = text.gsub(/#{filename}/, "#{i}")

    puts "Changing #{filename} to #{i}"

    File.open(test_file_name, "w") { |file| file.puts new_contents }
  end
  i += 1
end

puts "Done!"