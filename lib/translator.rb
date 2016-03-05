require 'yaml' 
require 'pry'

def load_library(file_path)
  yaml_emoticons = YAML.load_file(file_path)
  emoticons = { "get_meaning" => {}, "get_emoticon" => {} }

  yaml_emoticons.each do |meaning, emoticon_set|

    emoticons["get_meaning"].merge!({ emoticon_set[1] => meaning })
    emoticons["get_emoticon"].merge!({ emoticon_set[0] => emoticon_set[1] })

  end

  emoticons
end

def get_japanese_emoticon(file_path, emoticon)
  emoticon_library = load_library(file_path)
  translated_emoticon = emoticon_library["get_emoticon"][emoticon] 

  return "Sorry, that emoticon was not found" if translated_emoticon.nil?
  translated_emoticon
end

def get_english_meaning(file_path, emoticon)
  emoticon_library = load_library(file_path)
  translated_meaning = emoticon_library["get_meaning"][emoticon] 

  return "Sorry, that emoticon was not found" if translated_meaning.nil?
  translated_meaning
end