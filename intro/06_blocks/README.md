#Blocks#

If you have a good understanding of functions, **blocks** should be easy to pick up as well. In fact, it's easiest to think of blocks as nameless functions. Let's take a look.

```ruby
[1, 2, 3].each do |i|           # Block start
  puts i
end                             # Block end

[4, 5, 6].each { |i| puts "Hi" * i }    # This is also a block
```

As you can see, the ```each``` method expects a block as an argument. This can be invoked with the keywords ```do``` and ```end```, or by using braces (```{}```).

You might be wondering, "How is this helpful?" Well, in the previous examples, passing a block to a function essentially lets you customize the behavior of that function. Specifically, even though we're calling ```each``` on arrays of integers in every case, the block ultimately determines what happens to the elements. This **abstraction** shifts the focus onto the function's caller and ultimately makes the function more flexible.

Arrays actually have a lot of different methods which accept blocks as arguments. Here are a few:

```ruby
array1 = [1, 11, 111, 1111]
array1.map! { |i| i -= 1  }     # array1 == [0, 10, 110, 1110]

songs = ["My Favorite Things", "Climb Ev'ry Mountain", "Do-Re-Mi"]
songs.sort! { |first, second| second <=> first }   # Sort descending order

primes = [2, 3, 5, 7, 11, 13, 17, 19]
primes.select { |i| i > 10 }            # [11, 13, 17, 19]
```

Likewise, hashes also have methods which accept blocks as arguments.

```ruby
imdb_ratings = {
  "The Shawshank Redemption" => 9.2, 
  "The Godfather" => 9.2, 
  "The Godfather: Part II" => 9.0, 
  "The Dark Knight" => 8.9, 
  "Pulp Fiction" => 8.9
}

imdb_ratings.select { |k, v| v > 9 }
imdb_ratings.reject { |k, v| v > 9 }

more_ratings = {
  "12 Angry Men" => 8.9, 
  "Schindler's List" => 8.9
}

imdb_ratings.merge!(more_ratings)
```

Are you wondering how you can write your own functions to work with blocks? The secret lies in the keyword ```yield```:

```ruby
def block_required
  yield                   # Simplest way to execute a block
end

def block_optional
  yield if block_given?   # Only executes block if it's provided
  puts "Finished."
end

def random_attack
  attacks = {
    0 => "Jab", 
    1 => "Strong", 
    2 => "Fierce", 
    3 => "Short", 
    4 => "Forward", 
    5 => "Roundhouse"
  }

  yield attacks[rand(attacks.length)] if block_given?
end

block_required { puts "Yielding block" }    # Yielding block
block_optional                              # Finished.

random_attack { |attack| puts attack }
random_attack                               # Does nothing
```

The first, ```block_required```, shows the absolute minimum needed to execute a function which accepts a block as an argument. By itself, ```yield``` will merely execute the contents of the block passed to it. On the other hand, ```block_optional``` shows that within a function's body, you can check whether or not a block was provided. This allows you to add instructions that will execute no matter if a block is passed or not. Lastly, ```random_attack``` is an example of a function that yields a value back to the block. Keep in mind that it is possible to yield more than one value from a function. As you become more experienced, you might encounter times where this is appropriate.

#Knowledge Check#
1. What's the difference between calling ```songs.sort``` and ```songs.sort!```?

#Assignment#
game_rankings.rb

The Nintendo 64 was a very popular game console when I was growing up. People often like to argue about games based on their scores from magazines and other critical publications. Your task in this assignment is to find the average score of the top 10 games in ```game_rankings```. Once you have this value, *using blocks*, print out only the games in the list who have a score greater than the calculated average.

```ruby
# Top 10 Nintendo 64 games from Gamerankings

game_rankings = {
  "The Legend of Zelda: Ocarina of Time" => 0.9754, 
  "Super Mario 64" => 0.9641, 
  "GoldenEye 007" => 0.9470, 
  "Perfect Dark" => 0.9455, 
  "The Legend of Zelda: Majora's Mask" => 0.9195, 
  "1080: TenEighty Snowboarding" => 0.8960, 
  "Conker's Bad Fur Day" => 0.8928, 
  "Excitebike 64" => 0.8907, 
  "Turok 2: Seeds of Evil" => 0.8896, 
  "Paper Mario" => 0.8881
}

# Your code goes here

```
