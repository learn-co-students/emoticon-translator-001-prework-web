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
    if k == "get_emoticon"
      possible_emoticons = v.keys
      if possible_emoticons.include?(emoticon) == false
        return "Sorry, that emoticon was not found"
      end
      v.each do |en, jp|
        if en == emoticon
          return jp
        end
      end
    end
  end
end



def get_english_meaning(file_path, emoticon)
  # store the hash of emoticons
  emo_hash = load_library(file_path)
  # iterate over the hash
  emo_hash.each do |k, v|
    # check if we are looking at the right nested hash
    if k == "get_meaning"
      # generate list of all keys in nested hash
      possible_emoticons = v.keys
      # if the argument is not an option, return sorry...
      if possible_emoticons.include?(emoticon) == false
        return "Sorry, that emoticon was not found"
      end
      # return the translation of the desired emoticon, if present in the hash
      v.each do |jp, en|
        if jp == emoticon
          return en
        end
      end
    end
  end
end




















