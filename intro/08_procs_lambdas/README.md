#Procs and Lambdas#

In an earlier module, we covered the basics of Blocks and how they can be passed to functions. The content of this section is closely related but also particularly nuanced considering the slight differences between Blocks, *Procs* and *Lambdas*.

##Blocks##

The main difference between Blocks and the others is that they are *not* objects. We have not yet covered this topic in detail, but we will in the subsequent module. Suffice it to say, Blocks are short-lived and one of the few constructs in the Ruby language that are not truly objects. It might be easier to characterize them as part of the syntax of a function.

```ruby
{ puts "This will not print" }          # SyntaxError
{ puts "This is not an object" }.class  # Syntax
sound = { puts "Meow" }                 # SyntaxError
[3, 4, 5].each { |x| puts x**3 }        # Okay!
```

As you can see, Blocks can't be executed by themselves, nor can they can be assigned to a variable and reused. Blocks are only valid when passed as an argument to a compatible function. Finally, you can pass at most *one* block as an argument to a function.

##Procs##

Conceptually, Procs are reusable Blocks. They *can* be declared and used later. Functions that accept Blocks will also work with Procs: all you need to do is prefix the Proc variable with an ampersand when it's passed as an argument.

```ruby
squared = Proc.new { |x| x**2 }
to_string = Proc.new { |x| x.to_s }

squared.class   # Proc

array1 = [10, 11, 12]
array1.map!(&squared)       # [100, 121, 144]
array1.map!(&to_string)     # ["100", "121", "144"]

array2 = [100, 110, 120]
array2.map!(&squared)       # [10000, 12100, 14400]
array2.map!(&to_string)     # ["10000", "12100", "14400"]
```

Rather than passing a Proc to a function and then using the ```yield``` keyword, you can execute a Proc directly by using its ```call``` method.

```ruby
yell = Proc.new { puts "HEY!" }
yell.call                       # HEY!
```

Unlike Blocks, functions can accept multiple Procs as arguments:

```ruby
def multiple_parameters(proc1, proc2)
  proc1.call(3)     # 27
  proc2.call        # Finished
end

cubed = Proc.new { |x| x**3 }
finished = Proc.new { puts "Finished" }

multiple_parameters(cubed, finished)
```

##Lambdas##

A Lambda object is very similar to a Proc. In fact, if you inspect the ```class``` attribute, it will tell you it's a Proc type! Although that may be true, Lambdas and Procs are actually different in two important ways:

```ruby
random_proc = Proc.new { |x| puts rand(x) }
random_lambda = lambda { |x| puts rand(x) }

random_proc.call(5)         # Okay
random_lambda.call(5)       # Okay

random_proc.call            # Okay
random_lambda.call          # ArgumentError

random_proc.call(5, 6)      # Okay
random_lambda.call(5, 6)    # ArgumentError
```

As you can see above, even though the Proc and the Lambda have the same contents, they handle the number of arguments differently. They both work as expected when one argument is passed to ```call```.  However, when an incorrect number of arguments is passed to a Lambda, ```call``` will throw an ArgumentError. Compare that to what happens with a Proc. The Proc will *not* check the number of arguments passed to it. Specifically, if a Proc requires an argument but doesn't receive one, it will return ```nil```. If too many arguments are provided, it will ignore the unnecessary ones. 

```ruby
def early_proc
  early = Proc.new { return "Called Proc!" }
  puts early.call                               # Exits function
  puts "End of early_proc"
end

def full_lambda
  full = lambda { return "Called Lambda!" }
  puts full.call
  puts "End of full_lambda"
end

early_return    # Nothing printed
full_lambda     # "Called Lambda!" and "End of full_lambda" are both printed
```

The above example illustrates how Procs and Lambdas differ when ```return``` is included in their bodies. In the case of the former, the execution will leave the function early when ```call``` is invoked. By contrast, the Lambda will continue with the remaining instructions in the function. 

##All Three##

It's possible to write a function which accepts a block, a proc, *and* a lambda. The secret is to prefix a function parameter with ```&```:

```ruby
def chant(&block)               # Notice the &
  yield "Go!" if block_given?
end

# Block
chant { |word| puts "Block:\t#{x}" }                # Block:  Go!

# Proc
double = Proc.new { |word| puts "Proc:\t#{x * 2}" }
chant(&double)                                      # Proc:   Go!Go!

# Lambda
triple = lambda { |x| puts "Lambda:\t#{x * 3}" }    # Lambda: Go!Go!Go!
chant(&triple)
```

#Knowledge Check#

1. What does the Hash method ```delete_if``` do?

#Assignment#
towers.rb

I see quite a few famous buildings from my window and they reminded me of other famous landmarks around the world. Using the provided array, create a new one, ```sorted_array```, which rearranges the items in the original in *descending* order according to their heights. Afterwards, iterate over the newly created array using the lambda, ```conversion```, which will print out both the name of the tower as well as its height in inches, rounded to 1 decimal point.

```ruby
# Height in meters
towers = [
  { :name => "Berliner Fernsehturm", :height => 368.0 },
  { :name => "Canton Tower", :height => 600.0 },
  { :name => "Eiffel Tower", :height => 324.0 },
  { :name => "Tokyo Tower", :height => 332.6 },
  { :name => "Stratosphere Tower", :height => 350.2 }
]

factor = 100/2.54   # Converts centimeters to inches

conversion = lambda do |x|
  # Your code goes here
end

# Your code goes here
```
