# require modules here
require "yaml"

def load_library(file_path)
  # code goes here
  emoticons = {"get_meaning" => {}, "get_emoticon" => {}}
  YAML.load_file(file_path).each do |meaning, array|
    english, japanese = array
    emoticons["get_emoticon"][english] = japanese
    emoticons["get_meaning"][japanese] = meaning
  end
  emoticons
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  emoticons = load_library(file_path)
  find = emoticons["get_emoticon"][emoticon]
  if find
    find
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  # code goes here
  emoticons = load_library(file_path)
  find = emoticons["get_meaning"][emoticon]
  if find
    find
  else
    "Sorry, that emoticon was not found"
  end
end 