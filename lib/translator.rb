# require modules here
  require "yaml"
  require 'pry'

def load_library(emoticons)
  emoticons = YAML.load_file('./lib/emoticons.yml')
  translations = {"get_meaning" => {}, "get_emoticon" => {} }
  emoticons.each do |meaning, symbols|
    translations["get_meaning"][symbols[1]] = meaning
    translations["get_emoticon"][symbols[0]] = symbols[1]
  end
translations
end

def get_japanese_emoticon(path, emoticon)
  hash = load_library(path)
  if hash["get_emoticon"][emoticon]
    hash["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path, emoticon)
  hash = load_library(path)
  if hash["get_meaning"][emoticon]
    hash["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

# {"angel" =>      [ "O:)", "☜(⌒▽⌒)☞" ],
#  "angry" =>      [ ">:(", "ヽ(ｏ`皿′ｏ)ﾉ" ],
#  "bored" =>      [ ":O", "(ΘεΘ;)" ],
#  "confused" =>   [ "%)", "(゜.゜)" ],
#  "embarrased" => [ ":$", "(#^.^#)" ],
#  "fish" =>       [ "><>", ">゜))))彡" ],
#  "glasses" =>    [ "8D", "(^0_0^)" ],
#  "grinning" =>   [ "=D", "(￣ー￣)" ],
#  "happy" =>      [ ":)", "(＾ｖ＾)" ],
#  "kiss" =>       [ ":*", "(*^3^)/~☆" ],
#  "sad" =>        [ ":'(", "(Ｔ▽Ｔ)" ],
#  "surprised" =>  [ ":o", "o_O" ],
#  "wink" =>       [ ";)", "(^_-)" ]}


# {"O:)"=>"☜(⌒▽⌒)☞",
#  ">:("=>"ヽ(ｏ`皿′ｏ)ﾉ",
#  ":O"=>"(ΘεΘ;)",
#  "%)"=>"(゜.゜)",
#  ":$"=>"(#^.^#)",
#  "><>"=>">゜))))彡",
#  "8D"=>"(^0_0^)",
#  "=D"=>"(￣ー￣)",
#  ":)"=>"(＾ｖ＾)",
#  ":*"=>"(*^3^)/~☆",
#  ":'("=>"(Ｔ▽Ｔ)",
#  ":o"=>"o_O",
#  ";)"=>"(^_-)"}