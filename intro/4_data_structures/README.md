#Data Structure#

A common need when writing programs is to organize data efficiently. This becomes increasingly apparent as your code grows bigger and more sophisticated. Rather than telling you all about it, I'll try to show you.

**Containers** are a staple of clean, efficient, and well organized programming. They allow us to store many data items together in a logical way for later use. The most fundamental and basic container you'll learn is an **array**.

```ruby
meals_of_the_day = ["Breakfast", "Lunch", "Dinner"]

puts meals_of_the_day[0]    # Breakfast
puts meals_of_the_day[1]    # Lunch
puts meals_of_the_day[2]    # Dinner
```

First thing's first. You can store objects of all kinds in a container, whether they are Integers, Floats, or Strings. To access an individual item in an array, you use the syntax ```array_name[n]``` where n represents the **index** into the array. The first item in an array always corresponds to 0 rather than 1 as you might assume.

```ruby
days_of_the_week = [
    "Sunday", 
    "Monday", 
    "Tuesday", 
    "Wednesday", 
    "Thursday", 
    "Friday", 
    "Saturday"
]

puts days_of_the_week.length    # 7
puts days_of_the_week.count     # 7
puts days_of_the_week.size      # 7
```

If you want to know how many items are currently in an array, you call the methods ```length```, ```count```, and ```size``` (Note: we'll delve more into methods later).

#Assignment#
fibonacci.rb

```ruby

```
