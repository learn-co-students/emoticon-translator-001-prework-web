# require modules here
require "yaml"

def load_library(filepath)
  # code goes here
  emoticons_library = {"get_meaning" => {}, "get_emoticon" => {}}
  library_yaml = YAML.load_file(filepath)
  library_yaml.each do |meaning, emoticons| 
    emoticons_library["get_meaning"][emoticons[1]] = meaning
    emoticons_library["get_emoticon"][emoticons[0]] = emoticons[1]
  end
  emoticons_library
end

def get_japanese_emoticon(filepath, emoticon)
  # code goes here
  emoticons_library = load_library(filepath)
  if !emoticons_library["get_emoticon"].has_key?(emoticon)
    return "Sorry, that emoticon was not found"
  else
    emoticons_library["get_emoticon"][emoticon]
  end
end

def get_english_meaning(filepath, emoticon)
  # code goes here
  emoticons_library = load_library(filepath)
  if !emoticons_library["get_meaning"].has_key?(emoticon)
    return "Sorry, that emoticon was not found"
  else
    emoticons_library["get_meaning"][emoticon]
  end
end