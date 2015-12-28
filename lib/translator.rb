# require modules here
require "yaml"
def load_library(path)
  # code goes here
  translations = {}
  translations['get_meaning']  = {}
  translations['get_emoticon'] = {}
  file = YAML.load_file(path)
  file.each do |meaning, emoticons|
    translations["get_meaning"][emoticons[1]] = meaning.to_s
    translations["get_emoticon"][emoticons[0]] = emoticons[1]
  end
  translations
end

def get_japanese_emoticon(path, emoticon)
  # code goes here
  translations = load_library(path)
  if (translations["get_emoticon"].keys.include?(emoticon))
    translations["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path, emoticon)
  # code goes here
  translations = load_library(path)
  if (translations["get_meaning"].keys.include?(emoticon))
    translations["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

load_library("./lib/emoticons.yml")