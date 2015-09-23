# require modules here
require 'yaml'
require 'pry'

# COMPLETE
def load_library(file_path)
  # code goes here
  emoticons = YAML.load_file(file_path)
  translations = {}
  translations["get_emoticon"] = {}
  translations["get_meaning"] = {}
  emoticons.each do |meaning, symbol|
    translations['get_meaning'][symbol[1]] = meaning
    translations['get_emoticon'][symbol[0]] = symbol[1]
  end
  translations
end


# COMPLETE
def get_japanese_emoticon(file_path, emoticon)
  emo_hash = load_library(file_path)
  emo_hash.each do |k, v|
    possible_emoticons = v.keys
    if possible_emoticons.include?(emoticon) == false
      return "Sorry, that emoticon was not found"
    end
    if k == "get_emoticon"
      v.each do |en, jp|
        if en == emoticon
          return jp
        end
      end
    end
  end
end



def get_english_meaning
  # code goes here
end