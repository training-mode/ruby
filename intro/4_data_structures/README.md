#Data Structures#

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
    "Sunday",           # 0 
    "Monday",           # 1
    "Tuesday",          # 2
    "Wednesday",        # 3
    "Thursday",         # 4
    "Friday",           # 5
    "Saturday"          # 6
]

puts days_of_the_week.length    # 7
puts days_of_the_week.count     # 7
puts days_of_the_week.size      # 7
```

As you can see, the index corresponding to the last item in an array is always the length of the array minus 1. This is due to the 0-indexing of array elements. If you want to know how many items are currently in an array, you can call the methods ```length```, ```count```, and ```size``` (Note: we'll delve more into methods later).

The arrays above are both **homogenous** because all of the elements in the container are the same type. Similarly, you can create a **heterogenous** or "mixed" array just as easily.

```ruby
mixed_array = [123, "up-down-left-right", 99.99]
```

Ruby, being the flexible language that it is, allows you to create an array using this syntax too:

```ruby
array1 = Array.new          # []                Empty array
array2 = Array.new(3)       # [nil, nil, nil]   No default value specified
array3 = Array.new(3, 0)    # [0, 0, 0]         Default value is 0
```

#Assignment#
fibonacci.rb

```ruby

```
