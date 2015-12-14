# require modules here
require 'yaml'
require 'pry'

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  translate_emoticon = {"get_meaning" => {},
                        "get_emoticon" => {}}
  emoticons.each do |k, v|
    translate_emoticon['get_meaning'][v[1]] = k
    translate_emoticon['get_emoticon'][v[0]] = v[1]
  end
  translate_emoticon
  # code goes here
end

def get_japanese_emoticon
  # code goes here
end

def get_english_meaning
  # code goes here
end
