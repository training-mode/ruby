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

#Assignment#
?.rb

?

```ruby
# Your code goes here
```
