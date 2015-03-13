#Classes#

Phew, we've finally made it. Most introductory programming curricula culminate with the subject of **object-oriented programming**, so it's very important we cover this as objects are *everywhere*.

*Note: I highly recommend you look up the history of OOP in other sources. You might find it interesting.*

#How#

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
puts book1.title    # The Sun Also Rises

book1.describe  # The Sun Also Rises by Ernest Hemingway (251 pages)

book2 = Book.new    # ArgumentError
```

Here, ```book1``` is an **instance** of the Book class. Using the ```new``` method, you can create an instance of an Object (Note: we've seen this before with things like Hash). For it to work properly, you need to pass the correct number of arguments to the ```initialize``` method, otherwise you will get an error.

Be careful that you're passing the correct data types when creating an Object. Remember, the Ruby philosophy follows Duck Typing. Based on the class definition above, there's nothing wrong with this:

```ruby
book3 = Book.new(0,111,"Not a number")
book3.describe  # 0 by 111 (Not a number pages)
```

Make sure you understand the difference between a class and an instance. In case you're confused, the former is like a blueprint for the Object while the other is a concrete representation of the Object.

#Assignment#
?.rb

```ruby
# Your code goes here
```
