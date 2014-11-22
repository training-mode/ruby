#Control Flow#

Oftentimes, programs need dynamic behavior, otherwise a program will always and only ever do *1* thing. Thankfully, **conditional statements** are a staple of programming languages and Ruby is no different. Here are some things you need to know.

A very basic example of an if-else block:

```ruby
# 2014 population
japan = 126000000
usa = 319000000

if japan < usa
    puts "U-S-A!"
else
    puts "Nippon Ichi!
end
```

If you need to compare values, you must use the **relational operators**:
```
>  # Greater than
<  # Less than
== # Equal to
>= # Greater than or equal to
<= # Less than or equal to
```

You can have additional statements in your if-else block if you need them. Just use the **elsif** keyword:
```ruby
temperature = -1
if temperature > 30
    puts "Hot"
elsif temperature > 15
    puts "Warm"
elsif temperature > 0
    puts "Cold"
else
    puts "Very cold!"
end
```

#Assignment#
names.rb

```ruby
name1 = "Joffrey Baratheon"
name2 = "Arya Stark"
name3 = "Beric Dondarrion"
name4 = "Melisandre"
```

The characters in *Game of Thrones* are quite memorable, but memorizing their names can be difficult. The exercise in this unit is to find the average length of the names shown above and store it in a variable, **avg_length**. After that, you should declare a variable, **my_name**, and assign it the value that a user types into the console. Lastly, you should use an if-else block to compare the length of **my_name** to **avg_length** and print "[my_name] is shorter than average" when it is shorter, and "[my_name] is longer than average" otherwise.
