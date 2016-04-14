# require modules here
require 'yaml'
emoticons = YAML.load_file('./lib/emoticons.yml')

def load_library(arg)
  # code goes here
  hash = {
    "get_meaning" => {
      "☜(⌒▽⌒)☞" => "angel",
      "ヽ(ｏ`皿′ｏ)ﾉ" => "angry",
      "(ΘεΘ;)" => "bored",
      "(゜.゜)" => "confused",
      "(#^.^#)" => "embarassed",
      ">゜))))彡" => "fish",
      "(^0_0^)" => "glasses",
      "(￣ー￣)" => "grinning",
      "(＾ｖ＾)" => "happy",
      "(*^3^)/~☆" => "kiss",
      "(Ｔ▽Ｔ)" => "sad",
      "o_O" => "surprised",
      "(^_-)" => "wink"
      }, 
    "get_emoticon" => {
      "O:)" => "☜(⌒▽⌒)☞",
      ">:(" => "ヽ(ｏ`皿′ｏ)ﾉ",
       ":O" => "(ΘεΘ;)",
      "%)" => "(゜.゜)",
      ":$" => "(#^.^#)",
      "><>" => ">゜))))彡",
      "8D" => "(^0_0^)",
      "=D" => "(￣ー￣)",
      ":)" => "(＾ｖ＾)",
      ":*" => "(*^3^)/~☆",
      ":'(" => "(Ｔ▽Ｔ)",
      ":o" => "o_O",
      ";)" => "(^_-)"
    }
  }
end

def get_japanese_emoticon(filepath, emo)
  answer = ""
  hash = load_library(filepath)
  hash["get_emoticon"].each do |english, japanese|
    if english == emo
      answer = japanese
    elsif hash["get_emoticon"].include?(emo) == false
      answer = "Sorry, that emoticon was not found"
    end
  end
  answer
end

def get_english_meaning(filepath, emo)
  answer = ""
  hash = load_library(filepath)
  hash["get_meaning"].each do |japanese, word|
    if japanese == emo
      answer = word
    elsif hash["get_meaning"].include?(emo) == false
      answer = "Sorry, that emoticon was not found"
    end
  end
  answer
end