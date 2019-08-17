require 'yaml'

def load_library(filepath)
  emoji_dictionary = File.open(filepath) { |file| YAML.load(file) }
  resorted_dictionary ={}
  resorted_dictionary["get_meaning"]={}
  resorted_dictionary["get_emoticon"]={}
  emoji_dictionary.each { |emotion, emojis| resorted_dictionary["get_meaning"][emojis[1]] = emotion }
  emoji_dictionary.each_value { |emojis| resorted_dictionary["get_emoticon"][emojis[0]] = emojis[1] }
  resorted_dictionary
end

def get_japanese_emoticon(filepath, english_emoji)
  emoji_dictionary = load_library(filepath)
  found = emoji_dictionary["get_emoticon"][english_emoji]
  found ? found : "Sorry, that emoticon was not found"
end

def get_english_meaning(filepath, japanese_emoji)
  emoji_dictionary = load_library(filepath)
  found = emoji_dictionary["get_meaning"][japanese_emoji]
  found ? found : "Sorry, that emoticon was not found"
end
