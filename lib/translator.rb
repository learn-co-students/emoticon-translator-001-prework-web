# require modules here
require 'yaml'
require 'pry'
require 'pry-nav'

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  translation = {}
  translation["get_meaning"]  = {}
  translation["get_emoticon"] = {}
  
  emoticons.each do |meaning, emoticon_array|
    translation["get_meaning"][emoticon_array[1]] = meaning
    translation["get_emoticon"][emoticon_array[0]] = emoticon_array[1]
  end
  
  translation
end

def get_japanese_emoticon(file_path, emoticon)
  translator = load_library(file_path)
  
  if translator["get_emoticon"][emoticon] == nil
    "Sorry, that emoticon was not found"
  else
    translator["get_emoticon"][emoticon]
  end
end

def get_english_meaning(file_path, emoticon)
  translator = load_library(file_path)
  
  if translator["get_meaning"][emoticon] == nil
    "Sorry, that emoticon was not found"
  else
    translator["get_meaning"][emoticon]
  end
end



# emoticons => {"angel"=>["O:)", "☜(⌒▽⌒)☞"],
# "angry"=>[">:(", "ヽ(ｏ`皿′ｏ)ﾉ"],
# "bored"=>[":O", "(ΘεΘ;)"],
# "confused"=>["%)", "(゜.゜)"],
# "embarrased"=>[":$", "(#^.^#)"],
# "fish"=>["><>", ">゜))))彡"],
# "glasses"=>["8D", "(^0_0^)"],
# "grinning"=>["=D", "(￣ー￣)"],
# "happy"=>[":)", "(＾ｖ＾)"],
# "kiss"=>[":*", "(*^3^)/~☆"],
# "sad"=>[":'(", "(Ｔ▽Ｔ)"],
# "surprised"=>[":o", "o_O"],
# "wink"=>[";)", "(^_-)"]}

# translator => {"get_meaning"=>
#   {"☜(⌒▽⌒)☞"=>"angel",
#   "ヽ(ｏ`皿′ｏ)ﾉ"=>"angry",
#   "(ΘεΘ;)"=>"bored",
#   "(゜.゜)"=>"confused",
#   "(#^.^#)"=>"embarrased",
#   ">゜))))彡"=>"fish",
#   "(^0_0^)"=>"glasses",
#   "(￣ー￣)"=>"grinning",
#   "(＾ｖ＾)"=>"happy",
#   "(*^3^)/~☆"=>"kiss",
#   "(Ｔ▽Ｔ)"=>"sad",
#   "o_O"=>"surprised",
#   "(^_-)"=>"wink"},
# "get_emoticon"=>
#   {"O:)"=>"☜(⌒▽⌒)☞",
#   ">:("=>"ヽ(ｏ`皿′ｏ)ﾉ",
#   ":O"=>"(ΘεΘ;)",
#   "%)"=>"(゜.゜)",
#   ":$"=>"(#^.^#)",
#   "><>"=>">゜))))彡",
#   "8D"=>"(^0_0^)",
#   "=D"=>"(￣ー￣)",
#   ":)"=>"(＾ｖ＾)",
#   ":*"=>"(*^3^)/~☆",
#   ":'("=>"(Ｔ▽Ｔ)",
#   ":o"=>"o_O",
#   ";)"=>"(^_-)"}}