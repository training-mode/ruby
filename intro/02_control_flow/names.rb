# Game of Thrones characters
name1 = "Joffrey Baratheon"
name2 = "Arya Stark"
name3 = "Beric Dondarrion"
name4 = "Melisandre"

# Your code goes here
len1 = name1.length
len2 = name2.length
len3 = name3.length
len4 = name4.length

avg_length = (len1 + len2 + len3 + len4) / 4

my_name = gets.chomp

if my_name.length < avg_length
    puts "#{my_name} is shorter then average."
else
    puts "#{my_name} is longer then average."
end
