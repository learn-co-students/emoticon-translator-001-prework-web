# require modules here
require 'yaml'
require 'pry'


def load_library(file_path)
  # code goes here
  emoticon = YAML.load_file(file_path)
  #binding.pry
  h = {'get_meaning' => {}, 'get_emoticon' => {}}
  emoticon.each do |meaning, emoticon_array|
    h["get_meaning"][emoticon_array[1]] = meaning
    h["get_emoticon"][emoticon_array[0]] = [emoticon_array[1]].join
  end
  h
  #binding.pry
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  h = load_library(file_path)
  a = "Sorry, that emoticon was not found"
  h["get_emoticon"].each do |english, japanese|
    #binding.pry
    if english == emoticon
      a = japanese
    end
  end
  a
  #binding.pry
end

def get_english_meaning(file_path, emoticon)
  # code goes here
  h = load_library(file_path)
  a = "Sorry, that emoticon was not found"
  #binding.pry
  h["get_meaning"].each do |japanese, meaning|
    #binding.pry
    if japanese == emoticon
      a = meaning
    end
  end
  a
end
