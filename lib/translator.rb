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
end

def get_japanese_emoticon(file_path, emoticon)
  emoticons = load_library(file_path)
  translated_emoticon = emoticons["get_emoticon"][emoticon]
  translated_emoticon == nil ? "Sorry, that emoticon was not found" : translated_emoticon
end

def get_english_meaning(file_path, emoticon)
  emoticons = load_library(file_path)
  meaning = emoticons["get_meaning"][emoticon]
  meaning == nil ? "Sorry, that emoticon was not found" : meaning
  # code goes here
end
