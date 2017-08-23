require 'erb'

kids_data   = File.read('data/kids-data.txt')
naughty_letter = File.read('templates/naughty_letter_template.txt.erg')

kids_data.each_line do |kid|

  kid_data_array = kid.split

  name     = kid_data_array[0]
  gender   = kid_data_array[1]
  behavior = kid_data_array[2]
  toys     = kid_data_array[3..8]
  toy = kid_data_array[3]
  list_of_toys = kid_data_array[4..8]

  next unless behavior == 'naughty'

  filename    = 'letters/naughty/' + name + '.txt'
  letter_text = ERB.new(naughty_letter, nil, '-').result(binding)

  puts "Writing #{filename}."
  File.write(filename, letter_text)

end

puts 'Done!'
