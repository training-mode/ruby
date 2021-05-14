# Game of Thrones characters
name1 = "Joffrey Baratheon"
name2 = "Arya Stark"
name3 = "Beric Dondarrion"
name4 = "Melisandre"

# Your code goes here
avg_length = (name1.length + name2.length + name3.length + name4.length)/ 4
puts "What is your name"
my_name = gets

if (my_name.length < avg_length.size)
    puts "#{my_name} is shorter than average"
else
    puts "#{my_name} is longer than average"
end
