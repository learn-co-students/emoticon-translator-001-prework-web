# require modules here
require "yaml"
require 'pry'

def load_library(file_path)
  # code goes here
  library = YAML.load_file(file_path)
  get_meaning = {}
  library.each { |name, emoticon_array|
    get_meaning[emoticon_array[1]] = name
    }
  get_emoticon = {}
  library.each { |name, emoticon_array|
    get_emoticon[emoticon_array[0]] = emoticon_array[1]
    }
  {"get_meaning" => get_meaning, "get_emoticon" => get_emoticon}
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  library = load_library(file_path)
  if library["get_emoticon"].keys.include?(emoticon)
    japanese = library["get_emoticon"][emoticon]
    japanese
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  # code goes here
  library = load_library(file_path)
  if library["get_meaning"].keys.include?(emoticon)
    english = library["get_meaning"][emoticon]
    english
  else
    "Sorry, that emoticon was not found"
  end
end