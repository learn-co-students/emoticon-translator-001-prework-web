# require modules here
require "yaml"

def load_library(file_path)
  new_hash = {'get_meaning' => {}, 'get_emoticon' => {}}
  # code goes here
  YAML.load_file(file_path).each do |meaning,emojis|
    new_hash['get_meaning'][emojis[1]] = meaning
    new_hash['get_emoticon'][emojis[0]] = emojis[1]
  end
  new_hash
end

def get_japanese_emoticon(file_path,emoticon)
  # code goes here
  hash = load_library(file_path)
  translation = hash['get_emoticon'][emoticon]
  translation : translation ? "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path,emoticon)
  # code goes here
  hash = load_library(file_path)
  hash['get_meaning'].each do |japan,meaning|
    return meaning if japan == emoticon
  end
  "Sorry, that emoticon was not found"
end

