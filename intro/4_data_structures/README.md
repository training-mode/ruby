#Data Structures#

A common need when writing programs is to organize data efficiently. This becomes increasingly apparent as your code grows bigger and more sophisticated. Rather than telling you all about it, I'll try to show you.

**Containers** are a staple of clean, efficient, and well organized programming. They allow us to store many data items together in a logical way for later use. The most fundamental and basic container you'll learn is an **array**.

##Arrays##

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

Sometimes it's easier to access array elements in reverse order. You can see that in the following code:

```ruby
array1 = [0, 1, 2, 3]

puts array1[0] == array1[-4]    # true
puts array1[1] == array1[-3]    # true
puts array1[2] == array1[-2]    # true
puts array1[3] == array1[-1]    # true
```

One thing that may or may not surprise you is that you can interact with the individual characters in a String object the same way.

```ruby
question = "To be, or not to be..."

puts question[0]    # T
puts question[-1]   # .
```

The arrays above are **homogenous** because all of the elements in the container are the same type. Similarly, you can create a **heterogenous** or "mixed" array just as easily.

```ruby
mixed_array = [123, "up-down-left-right", 99.99]
```

Ruby, being the flexible language that it is, allows you to create an array using this syntax too:

```ruby
array1 = Array.new          # []                Empty array
array2 = Array.new(3)       # [nil, nil, nil]   No default value specified
array3 = Array.new(3, 0)    # [0, 0, 0]         Default value is 0
```

You'll often want to add new items to an array after you've already declared it. Ruby allows you to do that in the following ways:

```ruby
dicaprio_films = ["Catch Me If You Can", "The Aviator", "The Departed"]

dicaprio_films.push("Blood Diamond")        # Add to the end of array
dicaprio_films << "Revolutionary Road"      # Add to the end of array
dicaprio_films.insert(4, "Body of Lies")    # Add at index 4
```

You can also delete elements from an array:

```ruby
family = ["Peter", "Lois", "Chris", "Meg", "Stewie", "Brian"]

family.pop          # Removes last item (Brian)
family.delete_at(3) # Removes Meg
```

**Multidimensional arrays** are the last kind of array you should know at this time. An "array-of-arrays" is the most basic container which stores other containers. You'll find this in all sorts of programs.

```ruby
student_grades = [[100,97,99], [95,90,97], [0,0,0]]
mixed_array = ["a", ["b","c"], 4]
favorites = [
    ["Chipotle", "Qdoba"], 
    ["Metal Gear Solid 3", "The Last of Us", "Ico"], 
    ["Ruby", "Python"]
]
```

You should note that the elements in a multidimensional array don't necessarily all need to be the same size! Unless you know the dimensions of an array before you access it, don't assume anything!

Speaking of accessing arrays, how can we do that easily?

```ruby
years = [2011, 2012, 2013, 2014]

for year in years
    puts year
end

multi_array = [
    [0,1], 
    ["a", "b", "c"], 
    [1.11, 2.22], 
    [true, false, true]
]

for i in multi_array
    for item in i
        puts item
    end
end

# Equivalent
multi_array.each do |i|
    i.each do |item|
        puts item
    end
end
```

As you can see, iterating over arrays is a piece of cake when using for-loops. As long as you're going over each item sequentially, this kind approach makes the most sense.

##Hashes##

Another common and convenient way to organize data is to map key-value pairs in a container. That is the core idea behind a **hash** (also known as hashmap or dictionary).

```ruby
book = {
    "title" => "The Sun Also Rises", 
    "author" => "Ernest Hemingway", 
    "page_count" => 251
}

puts book["title"]       # The Sun Also Rises
puts book["author"]     # Ernest Hemingway
puts book["page_count"] # 251
```

The syntax for accessing a value stored in a hash is given by ```hash_name["key"]```. For every key in a hash, there is a corresponding value. If a value doesn't already exist for a given key, a hash will return ```nil```.

```ruby
puts book["publish_date"]   # nil
```

Similar to arrays, hashes can be created with an alternate syntax:

```ruby
high_scores = Hash.new              # No default value specified
high_scores["gradius"] = 17333150

answers = Hash.new(false)           # Default value is false
puts answers["question_1"]          # false
```

You can store objects of all kinds in a hash, and like arrays, it need not be one level deep:

```ruby
course = {
    "name" => "History 101",                # String
    "minutes" => 60,                        # Integer
    "students" => [                         # Array of hashes!
        {"name" => "Mary", "age" => 20}, 
        {"name" => "Takeshi", "age" => 21}, 
        {"name" => "John", "age" => 20}
    ]
}
```

To iterate over a hash, you can do it two different ways: 1) using a for-loop, or 2) using ```each```:

```ruby
for key, value in course
    puts "#{key} => #{value}"
end

course.each do |key, value|
    puts "#{key} => #{value}"
end
```

#Knowledge Check#
1. What is the return value of an array element outside the bounds of the array?

#Assignment#
queen.rb

I'm listening to *Bohemian Rhapsody* right now and so should you! Let's see if  you've been absorbing all of these data structures. I've provided the opening lyrics to their signature anthem. Your task is to print out each unique character in the lyrics along with the number of times it appears.

```ruby
# A little bit of classic rock

lyrics = "Is this the real life?"\
         "Is this just fantasy?"\
         "Caught in a landslide,"\
         "No escape from reality."

# Your code goes here

```
