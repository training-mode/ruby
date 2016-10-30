# Problem
You want to add some text to an image—perhaps a caption or a copyright statement.
# Solution
* Create an RMagick Draw object and call its annotate method, passing in your image and the text. 
* The following code adds the copyright string to the bottom-right corner of the mac_coffee.jpeg image. 
* It also specifies the font, the text color and size, and other
features of the text:
* Make sure you have installed rmagick gem and you have font file in the same directory as that of a program.

```bash
sudo gem install rmagick
```

```ruby
require 'rubygems'
require 'RMagick'
img = Magick::Image.read('mac.jpeg').first
my_text = "Copyrighted by sks147"
copyright = Magick::Draw.new
copyright.annotate(img, 0, 0, 3, 18, my_text) do
    self.font = 'Keyboard.ttf'
    self.pointsize = 25
    self.font_weight = Magick::BoldWeight
    self.fill = 'black'
    self.gravity = Magick::SouthEastGravity
end
img.write('mac_coffee_copyrighted.jpeg')
```

Initial image:
![mac_coffee](https://github.com/sks147/ruby/raw/master/intermediate/18_graphics/mac_coffee.jpeg)

Final image:
![mac_coffee](https://github.com/sks147/ruby/raw/master/intermediate/18_graphics/mac_coffee_copyrighted.jpeg)