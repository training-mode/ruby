# Control Flow

Oftentimes, programs need dynamic behavior, otherwise a program will always and only ever do *1* thing. Thankfully, **conditional statements** are a staple of programming languages and Ruby is no different. Here are some things you need to know.

## If-Else

A very basic example of an if-else block:

```ruby
# 2014 population
japan = 126000000
usa = 319000000

if japan < usa          # Is 126000000 less than 319000000? Yes
  puts "U-S-A!"       # This is executed
else                    # This is ignored
  puts "Nippon Ichi!"
end
```

In an if-else block, the ***if*** statement evaluates a **boolean expression**. This checks whether a comparison is **true** or **false**. If a comparison is found to be true, the program proceeds to the block directly beneath it. If found to be false, the block is ignored and the program checks the next comparison (an ***elsif*** or ***else*** statement).

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
if temperature > 30    # Is -1 > 30? Nope
  puts "Hot"
elsif temperature > 15 # Is -1 > 15? Nope
  puts "Warm"
elsif temperature > 0  # Is -1 > 0? Nope
  puts "Cold"
else                   # None of the above were true, so this must execute
  puts "Very cold!"    # This is the result
end
```

If it wasn't already clear, you *can* use an ```if``` statement without an ```else``` statement. In some programs, this makes sense:

```ruby
person = "King"
if person == "King"
  puts "Welcome back, Your Majesty"
end
```

Lastly, you can shorten a conditional statement to a 1-liner by using the ```then``` keyword:
```ruby

gpa = 4
if gpa == 4 then puts "Strong!" else puts "Try harder..." end
```

## Ternary Expression

You may encounter this in some programs, but you can represent conditional statements using **ternary expressions**. The above statement can be equivalently written the following way:

```ruby
gpa = 4
puts gpa == 4 ? "Strong" : "Try harder..."
```

## Unless

Does all that make sense? I hope so, because I'm about throw one more kind of conditional keyword at you: **unless**. While **if** statements are testing whether a condition is true, ```unless``` statements are testing whether a statement evaluates to **false**! Here's an example of where you might want to use it:

```ruby
is_convict = false
unless is_convict
  puts "You can vote."
end
```

```ruby
name = "Scrub"
puts "You are not the best Street Fighter" unless name == "Daigo"
```

## Case

An alternative to using the **if-else** statement in Ruby is **case**. This construct works pretty much the same way except it can be easier to match multiple values at once.

```ruby
age = 24
case age
when 0..12
  puts "Child"
when 13..19
  puts "Teenager"
when 20..30
  puts "Young Adult"
else
  puts "Adult"
end
```

What you can take away from this is that Ruby offers you quite a bit of flexibility on how to write conditional statements. Try not to feel overwhelmed at all of the options, but instead just focus on one or two styles. Keep using them until you feel really comfortable. At that point you might want to try the others.

# Knowledge Check
1. What is the result of ```"c" < "C"```? What about ```"1" > "A"```?

# Assignment
names.rb

```ruby
name1 = "Joffrey Baratheon"
name2 = "Arya Stark"
name3 = "Beric Dondarrion"
name4 = "Melisandre"
```

The characters in *Game of Thrones* are quite memorable, but memorizing their names can be difficult. The exercise in this unit is to find the average length of the names shown above and store it in a variable, **avg_length**. After that, you should declare a variable, **my_name**, and assign it the value that a user types into the console. Lastly, you should use an if-else block to compare the length of **my_name** to **avg_length** and print "[my_name] is shorter than average" when it is shorter, and "[my_name] is longer than average" otherwise.
