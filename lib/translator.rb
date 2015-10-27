# require modules here
require "pry"
require 'yaml'
def load_library(file)
  emoji = YAML.load_file(file)
  return_hash = {'get_meaning' => {}, 'get_emoticon' => {}}
  emoji.each do |meaning, emoticons|
    return_hash['get_meaning'][emoticons[1]] = meaning
    return_hash['get_emoticon'][emoticons[0]] = emoticons[1]
  end
  return_hash
end

def get_japanese_emoticon(file_path, emoticon)
  hash = load_library(file_path)
  if hash['get_emoticon'][emoticon] != nil
    hash['get_emoticon'][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
  
end

def get_english_meaning(file_path, emoticon)
    hash = load_library(file_path)
  if hash['get_meaning'][emoticon] != nil
    hash['get_meaning'][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end