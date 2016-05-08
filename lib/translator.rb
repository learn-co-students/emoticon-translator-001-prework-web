# require modules here
require 'yaml'
require 'pry'
def load_library(path)
  # code goes here
  hash = YAML.load_file(path)
  translator = {"get_meaning" => {}, "get_emoticon" => {}}
  hash.each { |meaning, emoticons|
    translator["get_meaning"][emoticons[1]] = meaning
    translator["get_emoticon"][emoticons[0]] = emoticons[1]
  }
  translator
end

def get_japanese_emoticon(path, emoticon)
  # code goes here
  translator = load_library(path)
  translator["get_emoticon"][emoticon] ?
    translator["get_emoticon"][emoticon] : "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emoticon)
  # code goes here
  translator = load_library(path)
  translator["get_meaning"][emoticon] ?
    translator["get_meaning"][emoticon] : "Sorry, that emoticon was not found"
end
