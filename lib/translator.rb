# require modules here
require 'yaml'
def load_library(path)
  # code goes here
  hash = YAML.load_file(path)
  get_meaning = {}
  get_emoticon = {}
  hash.each do |key, value|
    get_meaning[value[1]] = key
    get_emoticon[value[0]] = value[1]
  end
  return {'get_meaning'=> get_meaning, 'get_emoticon'=> get_emoticon}
end

def get_japanese_emoticon(path, emoticon)
  # code goes here
  trans = load_library(path)['get_emoticon'][emoticon]
  return trans ? trans : "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emoticon)
  # code goes here
  meaning = load_library(path)['get_meaning'][emoticon]
  return meaning ? meaning : "Sorry, that emoticon was not found"
end
