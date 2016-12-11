require "open-uri"

urls = [
  "https://www.reddit.com", 
  "https://www.facebook.com", 
  "https://www.spotify.com"
]

# Your code goes here
url_map = Hash.new
urls.each { |url| url_map[url.to_sym] = open(url) }
