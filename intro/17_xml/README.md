#XML#

**Extensible Markup Language** is another extremely common data serialization format that you will encounter in your programming pursuits.

##Local File##

```ruby
require "rexml/document"

xml_file = File.new("some_file.xml")
xml_doc = REXML::Document.new(xml_file)
```

##Network File##

```ruby
require "open-uri"
require "rexml/document"

reddit_xml = open("https://www.reddit.com/.xml").read
xml_doc = REXML::Document.new(reddit_xml)
```

#Knowledge Check#

1. ?

#Assignment#
?.rb
