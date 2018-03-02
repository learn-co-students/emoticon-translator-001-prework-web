# require modules here
require 'yaml'
require 'pry'

def load_library(path)
  # code goes here
  get_emoticon = {}
  get_meaning = {}
  YAML.load_file(path).each do |k, v|
    get_meaning[v[1]] = k
    get_emoticon[v[0]] = v[1]
  end
  result = {}
  result["get_meaning"] = get_meaning
  result["get_emoticon"] = get_emoticon
  result
end

def get_japanese_emoticon(path, emo)
  # code goes here
  dictionary = load_library(path)
  dictionary['get_emoticon'][emo] ? dictionary['get_emoticon'][emo] : "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emo)
  # code goes here
  dictionary = load_library(path)
  dictionary['get_meaning'][emo] ? dictionary['get_meaning'][emo] : "Sorry, that emoticon was not found"
end
