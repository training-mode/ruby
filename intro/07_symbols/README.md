#Symbols#

What is a Ruby **Symbol**? While it is similar to a String, it is best to think of it as conceptually closer to a name. What separates a Symbol from a String can be illustrated more succinctly in the following examples.

##Identity##

```ruby
string1 = "Antifragile"
string2 = "Antifragile"
string3 = string1

string1 == string2                      # true
string1.object_id == string2.object_id  # false
string1.object_id == string3.object_id  # true
```

When you compare two Strings, Ruby checks if the value of Strings are the same. This is usually what you'll want to know in your average program. However, if you actually compare a String's ```object_id``` with another newly declared String's ID, even if the Strings have the same value, the identifiers will be different. The reason for this has to do with the way a Ruby program keeps track of all the objects currently in its memory. Contrast that with ```string3```: when you compare the ```object_id``` of ```string1``` and ```string3```, you will see they are actually *equal*! In this way, you can see that ```string3``` is actually just pointing to the same thing in memory as ```string1```.


Let's see what happens when you try a similar test with Symbols instead:

```ruby
symbol1 = :antifragile
symbol2 = :antifragile
symbol3 = symbol1

symbol1 == symbol2                      # true
symbol1.object_id == symbol2.object_id  # true
symbol1.object_id == symbol3.object_id  # true
```

All of the comparisons evaluate to true! This means that all of these Symbols actually point to the *same* object in the program's memory. This fact highlights one important consequence of using Symbols over Strings: since they are only stored once, **they save memory**.

##Immutability##

We'll explore the topic of mutability more deeply in future modules, but since we're introducing Symbols in this lesson, it's important we touch on it right now. By default, Strings are *mutable*, meaning that their values can be freely changed without also changing the underlying ```object_id```.

```ruby
song = "Good Riddance"
song.object_id                  # e.g. 69872901258840
song << " (Time of Your Life)"  # Good Riddance (Time of Your Life)
song.object_id                  # Unchanged!
```

Even though we've modified the String's text, we're still dealing with the original object in memory.

When something is labeled as **immutable**, the opposite is true. An immutable object *cannot* be changed directly. For Strings, immutability can be invoked by the ```freeze``` method.

```ruby
album = "R U Still Down?"
album.object_id             # e.g. 69872900814920
album.freeze                # Object is now immutable
album << " (Remember Me)"   # RuntimeError: can't modify frozen String

album = "Still I Rise"
album.object_id             # Changed!
```

As you can see, when you call ```freeze```, you can no longer make changes to the String's text. Attempts to do so will produce a ```RuntimeError```. Make note that this is different from the second assignment of ```album```. If you set a variable to an entirely new String such as ```Still I Rise```, you're essentially pointing to an entirely different object in memory.

With all that out of the way, how does this pertain to Symbols? The answer is that **Symbols are immutable by default**.

```ruby
film = :"Die Hard"  # Alternate way to declare a Symbol
film.to_s           # Return String representation (Die Hard)
```

Once a Symbol is declared, the only way it can be changed is if it is completely overwritten with a new assignment. That is what distinguishes an immutable object from a mutable one.

Finally, how can we leverage this knowledge with what we already know about Ruby? The answer to that is found in hashes:

```ruby
castlevania_games = [
  {
    :title          => "Castlevania", 
    :platforms      => ["NES"], 
    :release_date   => "September 26, 1986"
  }, 
  {
    :title          => "Super Castlevania IV", 
    :platforms      => ["SNES"], 
    :release_date   => "October 31, 1991"
  }, 
  {
    :title          => "Castlevania: Symphony of the Night", 
    :platforms      => ["Playstation", "Sega Saturn"], 
    :release_date   => "March 20, 1997"
  }
]
```

It is common practice to use Symbols as keys in a hash due to their inherent immutability and memory saving properties. If you anticipate that a particular String will be reused many times over the course of a program's life, a Symbol can be quite helpful.

##Other##

As a quick reference, here are the ways you can create Symbols:

```ruby
state1 = :california
state2 = :"Rhode Island"
state3 = "Montana".to_sym
state4 = "Texas".intern
```

The methods ```to_sym``` and ```intern``` are helpful if you need to convert a collection of Strings into Symbols for some reason:

```ruby
taxonomic_ranks = [
  "Life", 
  "Domain", 
  "Kingdom", 
  "Phylum", 
  "Class", 
  "Order", 
  "Family", 
  "Genus", 
  "Species"
]

my_symbols = []

taxonomic_ranks.each { |rank| my_symbols << rank.intern }
```

One final tip: if you ever need to know what all of the Symbols in your Ruby program are, you can check the array, ```Symbol.all_symbols```. You'll find a lot of Symbols that are reused by the many parts of Ruby, but any Symbols you have also declared will be in there!

#Knowledge Check#

1. Are Symbols garbage collected?

#Assignment#
sites.rb

Without a doubt, we all spend a lot of time on the web. Your task in this module is to make a request to three different homepages: Reddit, Facebook, and Spotify. By including the ```open-uri``` module, you can easily get the data from a website through the ```open``` function. This function accepts a block and yields a File object representing the contents of the webpage. Create a hash, ```url_map```, and store the size of each page in it. The keys in this hash *must* be Symbols.

```ruby
require "open-uri"

urls = [
  "https://www.reddit.com", 
  "https://www.facebook.com", 
  "https://www.spotify.com"
]

# Your code goes here

```
