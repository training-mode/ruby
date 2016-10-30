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

# Discussion
The annotate method takes a code block that sets properties on the ```Magick::Draw```
object, describing how the annotation should be done.
What do these attributes do?
* The font attribute selects the font type from among those installed on your system. You can also specify the path to a specific font that is in a nonstandard location (e.g., /home/sks147/Arial.ttf).
* pointsize is the font size in points (the default is 12). By default, there is one pixel per point, so you can just specify the font size in pixels.
* ```font_weight``` accepts a ```WeightType``` constant. This can be a number (100, 200,
300,…900), BoldWeight (equivalent to 700), or the default of NormalWeight
(equivalent to 400).
* If you need your text to be italicized, you can set the font_style attribute to ```Magick::ItalicStyle```.
* ```fill``` defines the text color. The default is black. You can use X or SVG color names (such as white, red, gray85, and salmon), or you can express the color in terms of RGB values (such as #fff or #ffffff—two of the most common
formats). 
* ```gravity``` controls which part of the image will contain the annotated text, subject to the arguments passed in to annotate. ```SouthEastGravity``` means that offsets will be calculated from the bottom-right corner of the image. 
> Draw#annotate itself takes six arguments:
* The Image object, or else an ImageList containing the images you want to
annotate.
* The width and height of the rectangle in which the text is to be positioned.
* The x and y offsets of the text, relative to that rectangle and to the gravity of the Draw object.
* The text to be written.

* In the Solution we wrote:
```copyright.annotate(img, 0, 0, 3, 18, my_text)```.
The width and height are zeros, which indicates that annotate should use the whole image as its annotation rectangle. Earlier we gave the Draw object a gravity attribute of SouthEastGravity. This means that annotate will position the text at the bottomright corner of the rectangle; that is, at the bottom-right corner of the image itself.
* The offsets of 3 and 18 indicate that the text should start vertically 18 pixels from the bottom of the box, and end horizontally 3 pixels from the right border of the box.
* To position the text in the center of the image, we just change the gravity: 
```copyright.gravity = Magick::CenterGravity```
```copyright.annotate(img, 0, 0, 0, 0, my_text)```
* Note that we didn’t have to specify any offsets: CenterGravity orients the text to be in
the exact center of the image. Specifying offsets would only move the
text off-center.