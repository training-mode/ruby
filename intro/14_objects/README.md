#Objects#

By now, you should have a pretty good understanding of classes and why they can be helpful for programmers. What we haven't discussed yet is Ruby's interpretation of this paradigm and what makes it different from many other languages.

In Ruby, **everything is an object** (with only a few exceptions).

##Primitives##

In languages like C++ and Java, things like Integers, Floats, individual Characters, and Booleans are all considered **primitive data types**, the fundamental building blocks from which other **composite types** can be constructed. Primitives are *not* full-fledged Objects and cannot be extended through inheritance. By contrast, in Ruby these fundamental data types are in fact objects.

```ruby
10.class                # Fixnum
Fixnum.superclass       # Integer
Integer.superclass      # Numeric
Numeric.superclass      # Object
Object.superclass       # BasicObject

11.1.class              # Float
Float.superclass        # Numeric

"some string".class     # String
String.superclass       # Object

true.class              # TrueClass
TrueClass.superclass    # Object

false.class             # FalseClass
FalseClass.superclass   # Object
```

Calling the ```superclass``` method on a class name will tell you the parent class in the inheritance tree. Attempts to call ```superclass``` on BasicObject will return ```nil```, therefore it is the root of all Objects in Ruby.

##Nil##

In many other languages, **null** is a special type which represents the complete absence of data. To programmers with a background in those languages, the Ruby equivalent, **nil**, might be surprising:

```ruby
nil.class               # NilClass
NilClass.superclass     # Object
```

That's right, ```nil``` itself is an Object in Ruby.

##How about...##

In case you were wondering...

```ruby
Fixnum.class        # Class
Class.class         # Class
Class.superclass    # Module (interesting!)
Module.superclass   # Object
```

Calling the method, ```class```, on class names returns... Class. What is the parent of Class? Believe it or not, it is Module. 

##What are *not* Objects?##

It's pretty difficult to distill in a single sentence, but I'll try.

"Can you put it on the right-hand side of an assignment operator (```=```) by itself?" If the answer is no, it's not an Object. That means things like operators, looping constructs, methods, and *Blocks* are all exceptions.

The last one may or may not surprise you.

```ruby
not_a_block = { puts "This doesn't work" }      # Syntax error

some_lambda = lambda { puts "Am I an object?" }
some_lambda.class       # Proc
Proc.superclass         # Object
```

Remember, Procs and Lambdas are in fact Objects. The fact that Blocks are not makes them unique.

#Assignment#
?.rb

```ruby
# Your code goes here
```
