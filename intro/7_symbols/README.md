#Symbols#

What is a Ruby **symbol**? While it is similar to a String, it is best to think of it as conceptually closer to a name. What separates a symbol from a String can be illustrated more succinctly in the following examples.

```ruby
string1 = "Antifragile"
string2 = "Antifragile"
string3 = string1

string1 == string2                      # true
string1.object_id == string2.object_id  # false
string1.object_id == string3.object_id  # true
```

When you compare two Strings, Ruby checks if the value of Strings are the same. This is usually what you'll want to know in your average program. However, if you actually compare a String's ```object_id``` with another newly declared String's ID, even if the Strings have the same value, the identifiers will be different. The reason for this has to do with the way a Ruby program keeps track of all the objects currently in its memory. Contrast that with ```string3```: when you compare the ```object_id``` of ```string1``` and ```string3```, you will see they are actually *equal*! In this way, you can see that ```string3``` is actually just pointing to the same thing in memory as ```string1```.


Let's see what happens when you try a similar test with symbols instead:

```ruby
symbol1 = :antifragile
symbol2 = :antifragile
symbol3 = symbol1

symbol1 == symbol2                      # true
symbol1.object_id == symbol2.object_id  # true
symbol1.object_id == symbol3.object_id  # true
```

All of the comparisons evaluate to true! This means that all of these symbols actually point to the *same* object in the program's memory. This fact highlights one important consequence of using symbols over Strings: since they are only stored once, **they save memory**.


#Assignment#
?.rb

```ruby
# Your code goes here

```
