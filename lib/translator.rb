require "yaml"
require "pry"

def load_library(path)
  library = YAML.load_file(path)
  sorted_library = {"get_meaning" => {}, "get_emoticon" => {}}

  library.each do |meaning, emoticons|
    sorted_library["get_meaning"][emoticons[1]] = meaning
    sorted_library["get_emoticon"][emoticons[0]] = emoticons[1]
  end

  sorted_library
end

def get_japanese_emoticon(path, emoticon)
  library = load_library(path)
  library["get_emoticon"].has_key?(emoticon) ? library["get_emoticon"][emoticon] : "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emoticon)
  library = load_library(path)
  library["get_meaning"].has_key?(emoticon) ? library["get_meaning"][emoticon] : "Sorry, that emoticon was not found"
end