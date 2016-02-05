require 'pry'
require "yaml"


def load_library(path)
  emoticons = YAML.load_file(path)

  library = {"get_emoticon" => {}, "get_meaning" => {}}
 emoticons.each do |meaning, array|
   library["get_emoticon"][array[0]]= array[1]
   library["get_meaning"][array[1]] = meaning
 end
 library
end

def get_japanese_emoticon(path, emoticon)
  emojis = load_libary(path)
if emojis["get_emoticon"].has_key?(emoticon)
  emojis["get_emoticon"][emoticon]
else
  "Sorry, that emoticon was not found"
end

end

def get_english_meaning
  # code goes here
end