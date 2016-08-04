# require modules here
require 'yaml'


def load_library(file_path)
  yaml = YAML.load_file(file_path)
  dict = {"get_meaning" => {}, "get_emoticon" => {}}
  yaml.each do |meaning, emoticons|
    dict["get_meaning"][emoticons[1]]= meaning
    dict["get_emoticon"][emoticons[0]]= emoticons[1]
  end
  dict
end

def get_japanese_emoticon(file_path, emoticon)
  lib = load_library(file_path)
    if lib["get_emoticon"].include?(emoticon)
      lib["get_emoticon"][emoticon]
    else
      "Sorry, that emoticon was not found"
    end
end

def get_english_meaning(file_path, emoticon)
  lib = load_library(file_path)
  if lib["get_meaning"].include?(emoticon)
    lib["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end
