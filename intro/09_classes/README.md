#Classes#

Phew, we've finally made it. Most introductory programming curricula culminate with the subject of **object-oriented programming**, so it's very important we cover this as objects are *everywhere*.

*Note: I highly recommend you look up the history of OOP in other sources. You might find it interesting.*

Do you remember how we coded a book as hash? It's in module 4 in case you don't remember:

```ruby
book = {
  "title" => "The Sun Also Rises", 
  "author" => "Ernest Hemingway", 
  "page_count" => 251
}
```

This piece of code is already quite similar to what an Object is. An Object is a data structure that has **fields** (also called **attributes** or **data members**), and **methods**.

```ruby
class EmptyClass
  # No fields or methods.
end

class GreetingClass
  # Has one method, no attributes
  def say_hello
    puts "Hello!"
  end
end

class Book
  # Has data members, so include initialize
  def initialize(title, author, page_count)
    @title = title
    @author = author
    @page_count = page_count
  end

  def describe
    puts "#{@title} by #{@author} (#{@page_count} pages)"
  end
end
```

The keyword ```class``` is what makes the magic happen. The class declaration above has defined what a ```Book``` Object is. This short snippet describes a Book as having three attributes: ```title```, ```author```, and ```page_count```. Make note that the proper syntax for declaring an attribute is ```@attribute_name```: it must be preceded by the ```@``` character to be valid and it must appear in the ```initialize``` method.

What is a method? Simply put, a method is just a function that is a part of a class. The purpose of a method is to interact with an Object's attributes in some way, whether that's changing them or merely passing them along to a different part of your code.

What does ```initialize``` do? In this case, it is a special method which must be included for any object which has attributes. As the name suggests, ```initialize``` is the process through which an Object will initialize its state when it's first created:

```ruby
book1 = Book.new("The Sun Also Rises", "Ernest Hemingway", 251)
book1.describe  # The Sun Also Rises by Ernest Hemingway (251 pages)

book2 = Book.new    # ArgumentError
```

Here, ```book1``` is an **instance** of the Book class. Using the ```new``` method, you can create an instance of an Object (Note: we've seen this before with things like Hash). For it to work properly, you need to pass the correct number of arguments to the ```initialize``` method, otherwise you will get an error.

Be careful that you're passing the correct data types when creating an Object. Remember, the Ruby philosophy follows Duck Typing. Based on the class definition above, there's nothing wrong with this:

```ruby
book3 = Book.new(0,111,"Not a number")
book3.describe  # 0 by 111 (Not a number pages)
```

The last thing I'd like to introduce in this module are **class variables**. While attributes are associated with an individual instance of a class and are likely to be different, class variables are owned by the class itself.

```ruby
class CoinFlip
  @@flip_count = 0                      # Class variable

  def initialize
    @side = rand(2)
    @@flip_count += 1
  end

  def result                            # Translate attribute to English
    return "Heads" if @side == 0
    "Tails"
  end

  def self.number_of_flips              # Makes class variable accessible
    @@flip_count
  end
end

flips = []
for i in 1..10
  flips << CoinFlip.new
end

puts CoinFlip.number_of_flips           # 10

flips.each { |flip| puts flip.result }
```

What I've shown above is a popular pattern in programming to keep track of how many of a given Object have been created. The ```initialize``` method increments the class variable serving as a counter. Since the visibility of a variable is limited by default, a new method, ```self.number_of_flips```, is included so that other parts of your code can get this information. We will explore the topic of scope and visibility in the next couple of modules.

Make sure you understand the difference between a class and an instance. In case you're confused, the former is like a blueprint for the Object while the other is a concrete representation of the Object.

#Knowledge Check#

1. What does the method ```respond_to?``` do?

#Assignment#
phones.rb

In real world applications, classes are used to model both abstract and concrete things. For example, the characteristics of a smartphone can be represented in a basic class. Using what you've learned, complete the Phone class below so that it has the attributes 1) brand, 2) model, 3) operating_system, and 4) release_date. I've already included an array of hashes which you will convert to Phone instances. These newly formed instances should be added to ```new_phones```.

```ruby
require "date"

class Phone
  # Your code goes here
end

phones = [
  {
    :brand              => "Apple",
    :model              => "iPhone 1st gen",
    :operating_system   => "iPhone OS 1.0",
    :release_date       => Date.new(2007, 6, 29)
  },
  {
    :brand              => "Google",
    :model              => "Nexus One",
    :operating_system   => "Android 2.1 Eclair",
    :release_date       => Date.new(2010, 1, 5)
  },
  {
    :brand              => "Samsung",
    :model              => "Galaxy S",
    :operating_system   => "Android 2.3.6 Gingerbread",
    :release_date       => Date.new(2010, 6, 4)
  }
]

new_phones = []

# Your code goes here

```
