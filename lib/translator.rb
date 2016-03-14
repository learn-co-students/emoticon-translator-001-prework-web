require 'yaml' 
require 'pry'
# require modules here

def load_library(file)
  japanese_emoticons = YAML.load_file(file)
  meaning_hash = {}
  japanese_emoticons.each do |meaning, emoticon|
    meaning_hash[emoticon.last] = meaning 
  end
  english_hash = {}
  japanese_emoticons.each do |meaning, emoticon|
    english_hash[emoticon.first] = emoticon.last
  end
  emoticon_dictionary = {}
  emoticon_dictionary["get_meaning"] = meaning_hash
  emoticon_dictionary["get_emoticon"] = english_hash
  emoticon_dictionary
end

def get_japanese_emoticon(file, emoticon)
  emoticon_dictionary = load_library(file)
  japanese_translation = []
  emoticon_dictionary.each do |heading, translations|
    if heading == "get_emoticon"
      translations.each do |english, japanese|
        japanese_translation << japanese if english == emoticon
      end
    end
  end
  if japanese_translation.empty? 
    "Sorry, that emoticon was not found" 
  else 
    japanese_translation.join
  end
end

def get_english_meaning(file, emoticon)
  emoticon_dictionary = load_library(file)
  english_meaning = []
  emoticon_dictionary.each do |heading, translations|
    if heading == "get_meaning"
      translations.each do |japanese, meaning|
        english_meaning << meaning if japanese == emoticon
      end
    end
  end
    if english_meaning.empty? 
    "Sorry, that emoticon was not found" 
  else 
    english_meaning.join
  end
end




