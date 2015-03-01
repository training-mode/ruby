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

block_required { puts "Yielding block" }    # Yielding block
block_optional                              # Finished.
```

#Knowledge Check#
1. What's the difference between calling ```songs.sort``` and ```songs.sort!```?

#Assignment#
?.rb

?

```ruby
# Your code goes here
```
