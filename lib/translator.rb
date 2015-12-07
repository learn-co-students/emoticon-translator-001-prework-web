require 'yaml'
require 'pry'

def load_library(file)
  file_hash = YAML.load_file(file)
  result_hash = {}
  
=begin
  file_hash
  => {"angel"=>["O:)", "☜(⌒▽⌒)☞"],
 "angry"=>[">:(", "ヽ(ｏ`皿′ｏ)ﾉ"],
 "bored"=>[":O", "(ΘεΘ;)"],
 "confused"=>["%)", "(゜.゜)"],
 "embarrased"=>[":$", "(#^.^#)"],
 "fish"=>["><>", ">゜))))彡"],
 "glasses"=>["8D", "(^0_0^)"],
 "grinning"=>["=D", "(￣ー￣)"],
 "happy"=>[":)", "(＾ｖ＾)"],
 "kiss"=>[":*", "(*^3^)/~☆"],
 "sad"=>[":'(", "(Ｔ▽Ｔ)"],
 "surprised"=>[":o", "o_O"],
 "wink"=>[";)", "(^_-)"]}
=end

  result_hash['get_meaning'] = {}
  result_hash['get_emoticon'] = {}

  file_hash.each do |i, j|
    result_hash['get_emoticon'][(j[0])] = j[1]
    result_hash['get_meaning'][(j[1])] = i
  end

  result_hash
end


def get_japanese_emoticon(file, emoticon)
  library = load_library(file)

  if library["get_emoticon"][emoticon] == nil
    return "Sorry, that emoticon was not found"
  else
    library["get_emoticon"][emoticon]
  end

end


def get_english_meaning(file, emoticon)
  library = load_library(file)

  if library["get_meaning"][emoticon] == nil
    return "Sorry, that emoticon was not found"
  else
    library["get_meaning"][emoticon]
  end

end
