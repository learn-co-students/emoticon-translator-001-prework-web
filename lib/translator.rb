require 'yaml'

def load_library(file)
  loaded_file = YAML.load_file(file)
  library = { "get_meaning" => {}, "get_emoticon" => {} }
  loaded_file.each do |meaning, emoticons|
    library["get_meaning"][emoticons.last] = meaning
    library["get_emoticon"][emoticons.first] = emoticons.last
  end
  library
end

def get_japanese_emoticon(file, emoticon)
  library = load_library(file)
  library["get_emoticon"][emoticon] == nil ? "Sorry, that emoticon was not found" : library["get_emoticon"][emoticon]
end

def get_english_meaning(file, emoticon)
  library = load_library(file)
  library["get_meaning"][emoticon] == nil ? "Sorry, that emoticon was not found" : library["get_meaning"][emoticon]
end