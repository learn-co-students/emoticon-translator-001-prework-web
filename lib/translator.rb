# require modules here
require "yaml"

def load_library(path)
  # code goes here
  yaml_hash = YAML.load_file(path)
  my_hash = { "get_meaning" => {}, "get_emoticon" => {}}
  yaml_hash.each do |meaning, emoticons|
    english = emoticons[0]
    japanese = emoticons[1]
    my_hash["get_meaning"][japanese] = meaning
    my_hash["get_emoticon"][english] = japanese
  end
  my_hash
end

def get_japanese_emoticon(path, emoticon)
  my_hash = load_library(path)
  if my_hash["get_emoticon"][emoticon] == nil
    "Sorry, that emoticon was not found"
  else
    my_hash["get_emoticon"][emoticon]
  end
end

def get_english_meaning(path, emoticon)
  my_hash = load_library(path)
  if my_hash["get_meaning"][emoticon] == nil
    "Sorry, that emoticon was not found"
  else
    my_hash["get_meaning"][emoticon]
  end
end