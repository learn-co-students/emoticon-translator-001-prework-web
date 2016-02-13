require "yaml"
require 'pry'

def load_library(file_path)

  japan = []
  usa = []
  emoticons = Hash.new
  emoticons["get_meaning"] = {}
  emoticons["get_emoticon"] = {}
  
  raw_yaml = YAML.load_file(file_path)
  
  raw_yaml.each do |word, faces|
      emoticons["get_meaning"].merge!(faces[1] => word)
      emoticons["get_emoticon"].merge!(faces[0] => faces[1])
  end

  emoticons

end

def get_japanese_emoticon(file_path, emoticon)
  emoticons = load_library(file_path)

  result = emoticons["get_emoticon"][emoticon]
  result != nil ? result : "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  emoticons = load_library(file_path)

  result = emoticons["get_meaning"][emoticon]
  result != nil ? result : "Sorry, that emoticon was not found"
end