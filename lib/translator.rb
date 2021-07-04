# require modules here
require 'yaml'
require 'pry'

def load_library(path)
  emoticons = YAML.load_file(path)
  sorted_emoticons = {"get_meaning"=>{},"get_emoticon"=>{}}
  emoticons.each do |meaning, emojis|
    sorted_emoticons["get_meaning"][emojis[1]]= meaning
    sorted_emoticons["get_emoticon"][emojis[0]]= emojis[1] 
    
  end
  sorted_emoticons
end

def get_japanese_emoticon(path, emoticon)
  emoticons = load_library(path)
  japanese_emoticon = nil
  if emoticons["get_emoticon"].has_key?(emoticon)
    japanese_emoticon = emoticons["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path, emoticon)
  emoticons = load_library(path)
  meaning = nil
  if emoticons["get_meaning"].has_key?(emoticon)
    meaning = emoticons["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
  # code goes here
end