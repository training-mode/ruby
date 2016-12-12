require 'rubygems'
require 'RMagick'
img = Magick::Image.read('mac_coffee.jpeg').first
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