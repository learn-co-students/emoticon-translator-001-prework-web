# require modules here
require "yaml"

def load_library(filepath)
  file = YAML.load_file(filepath)
  hash = {"get_meaning" => {}, "get_emoticon" => {}}
  file.each do |meaning, info|
    hash["get_meaning"][info[1]] = meaning
    hash["get_emoticon"][info[0]]= info[1]  
  end  
  hash
end

def get_japanese_emoticon(filepath, emoticon)
  # code goes here
  hash = load_library(filepath)
  if hash["get_emoticon"].include?(emoticon)
    hash["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end  
end

def get_english_meaning(filepath, emoticon)
  hash = load_library(filepath)
    if hash["get_meaning"].include?(emoticon)
      hash["get_meaning"][emoticon]
    else
      "Sorry, that emoticon was not found" 
    end
end
