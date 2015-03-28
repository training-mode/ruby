#Encapsulation#

**Information hiding** is an important principle in software development, though it might be a little difficult to understand as a beginner. All of the examples and programs we've worked on so far have been very basic, and you as the developer can see how all of the pieces work. After all, you've been writing the code yourself.

However, in the real world, the projects you work on will likely include code that another person crafted. You do not necessarily need to know how a certain class or function works internally: in most circumstances, you only care that it does what it says. For example, you don't know how an array's ```sort``` is implemented, but you do care that works correctly. Likewise, when you make a request to a website using ```open```, as a caller, you don't need to concern yourself with the specifics.

When you write classes, you should take the concept of **encapsulation** to heart. What attributes in a class should be accessible to the outside world? By contrast, what data members should remain hidden? The more sophisticated you become in this mode of thinking, the better of an object-oriented programming you will be.

```ruby
class Television
  def initialize(brand, width, resolution, hertz)
    @brand = brand
    @width = width
    @resolution = resolution
    @hertz = hertz
  end
end

tv1 = Television.new("Samsung", 32, 1080, 60)
tv1.brand   # NoMethodError
``` 

As you can see above, a Television object is declared but none of its internals are available to the outside world. In this way, we can say all of its data members are **private**. As a matter of fact, you can use the ```private``` keyword on methods as well to change their default visibility which happens to be **public**.

```ruby
class Television
  def initialize(brand, width, resolution, hertz)
    @brand = brand
    @width = width
    set_resolution(resolution)  # Validate argument
    @hertz = hertz
  end

  public            # Note: methods are public by default
  def describe
    puts "#{@brand} #{@width}-inch #{@resolution}p #{@hertz}Hz"
  end

  private           # This method can only be called within the class
  def set_resolution(resolution)
    raise ArgumentError if not resolution > 0
    @resolution = resolution
  end
end

tv1 = Television.new("Samsung", 32, 1080, 60)
tv1.describe                # Samsung 32-inch 1080p 60Hz
tv1.set_resolution(4000)    # NoMethodError
```

Including the ```public``` keyword on methods is not necessary but it can make your code easier to read. With that said, the method, ```set_resolution```, is a simple example of when you might want to make something private. If you only intend to set the data members of an instance once, there shouldn't be a reason that a method like ```set_resolution``` should be public. Typically, internal methods that do things like validation should remain hidden.

So when is it acceptable for the internal attributes of an instance to be accessible to the outside world? It certainly would be helpful if we could type something like ```tv1.brand``` and get its value directly! With that in mind, the most fundamental choice you have as a developer when limiting a class has to do with permissions: should you grant outside callers **read** access, **write** access, or **both**?

You've probably come across this in other kinds of applications. If you've ever worked on a shared document, you can control who has view privileges (i.e. read-only) and who can edit it (i.e. read+write). The same basic idea underlies classes and the design of **interfaces**.

```ruby
class Notebook
  attr_reader :length
  attr_writer :width
  attr_accessor :title

  def initialize(length, width, title)
    @length = length
    @width = width
    @title = title
  end
end

notebook = Notebook.new(11.0, 9.8, "Chinese 101")
notebook.length             # Okay (read access)

notebook.width              # NoMethodError
notebook.width = 10         # Okay (write access)

notebook.title              # Okay (read access)
notebook.title = "Calculus" # Okay (write access)
```

When you put the methods ```attr_reader```, ```attr_writer```, or ```attr_accessor``` in front of a symbol that corresponds to a class field, the visibility on that data member will be modified. The first, ```attr_reader```, makes an attribute readable but *not* writable. The second does the exact opposite: an attribute can be modified but not read. Finally, ```attr_accessor``` is the most permissive, allowing a field to be freely read and changed.

For your own reference, Ruby automagically translates the ```attr_****``` business into the following equilavent pieces of code:

```ruby
# attr_reader :length
def length
  @length
end

# attr_writer :width
def width=(value)
  @width = value
end

# attr_accessor :title
def title
  @title
end

def title=(value)
  @title = value
end
```

As an aside, in other languages, these kinds of methods are usually called **getters** and **setters**.

#Knowledge Check#

1. What are the benefits of using a setter method over directly making changes to an instance variable?

#Assignment#
netflix.rb

If you're like most people, you probably watch a lot of Netflix every week. In this assignment, complete the NetflixAccount class implementation. Make sure that some validation is performed before adding items to either ```my_list``` or ```recently_watched```. Also, specify that each attribute is readable.

```ruby
class Movie
  attr_reader :title

  def initialize(title)
    @title = title
  end
end

class NetflixAccount
  # Your code goes here

  def initialize(username)
    @username = username
    @my_list = []
    @recently_watched = []
  end

  def add_to_my_list(movie)
    # Your code goes here
  end

  def remove_from_my_list(movie)
    # Your code goes here
  end

  def watch(movie)
    # Your code goes here
  end
end

movies = [
  Movie.new("Seven Samurai"), 
  Movie.new("Wall Street"), 
  Movie.new("Big Hero 6")
]

account = NetflixAccount.new("user123")
account.watch(movies[0])
account.add_to_my_list(movies[1])
account.add_to_my_list(movies[2])
account.remove_from_my_list(movies[2])
```
