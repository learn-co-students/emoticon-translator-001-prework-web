# require modules here
require 'pry'
require 'yaml'

def load_library(file_path)
  # code goes here
  if File.exist?(file_path)
  	emoticons = YAML.load_file(file_path)
  end
  hash = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }
	emoticons.each do |key, value|
    value.each_with_index do |emoticon, index|
      if index == 0
        hash["get_emoticon"][emoticon] = value[-1]
      else
        hash["get_meaning"][emoticon] = key
      end
    end
  end
  # binding.pry
  hash
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  lib = load_library(file_path)
  if lib["get_emoticon"].has_key?(emoticon)
    return lib["get_emoticon"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
  # binding.pry
end

def get_english_meaning(file_path, emoticon)
  # code goes here
  lib = load_library(file_path)
  if lib["get_meaning"].has_key?(emoticon)
    return lib["get_meaning"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

# load_library('./lib/emoticons.yml')
# get_japanese_emoticon('./lib/emoticons.yml', ":)")