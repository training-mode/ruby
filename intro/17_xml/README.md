#XML#

**Extensible Markup Language** is another extremely common data serialization format that you will encounter in your programming pursuits. XML has been a staple of data transmission in networked applications for many years, and when paired with things like XML Schema and XSLT, its scope and value is further expanded.

```xml
<product>
  <name>Guardians of the Galaxy</name>
  <price>$20.00</price>
  <category>Movies</category>
</product>
```

An object represented using XML is in essence a hierarchy of parent and child tags. A basic attribute value is enclosed with tags like ```<tagName></tagName>```. By design XML is inflexible in its syntax, so while it helps validate datatypes and document structure, it means you will sometimes have to deal with issues related to malformed documents.

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
