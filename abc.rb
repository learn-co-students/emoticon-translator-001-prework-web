=begin
{"get_meaning"=>{"☜(⌒▽⌒)☞"=>"angel",
"ヽ(ｏ`皿′ｏ)ﾉ"=>"angry",
"(ΘεΘ;)"=>"bored",
"(゜.゜)"=>"confused",
"(#^.^#)"=>"embarrased",
">゜))))彡"=>"fish",
"(^0_0^)"=>"glasses",
"(￣ー￣)"=>"grinning",
"(＾ｖ＾)"=>"happy",
"(*^3^)/~☆"=>"kiss",
"(Ｔ▽Ｔ)"=>"sad",
"o_O"=>"surprised",
"(^_-)"=>"wink"},
#

"get_emoticon"=>{"O:)"=>"☜(⌒▽⌒)☞",
">:("=>"ヽ(ｏ`皿′ｏ)ﾉ",
":O"=>"(ΘεΘ;)",
"%)"=>"(゜.゜)",
":$"=>"(#^.^#)",
"><>"=>">゜))))彡",
"8D"=>"(^0_0^)",
"=D"=>"(￣ー￣)",
":)"=>"(＾ｖ＾)",
":*"=>"(*^3^)/~☆",
":'("=>"(Ｔ▽Ｔ)",
":o"=>"o_O",
";)"=>"(^_-)"}}
=end





require "yaml"



def load_library(abc)
  emo= YAML.load_file(abc)
   xyz={"get_meaning" => {}, "get_emoticon" => {}}
  emo.each do |i,g|
    xyz["get_meaning"][g[1]]= i
   # xyz["get_emoticon"][g[0]] = i
    xyz["get_emoticon"][g[0]] = g[1]
  end


    return xyz
  # code goes here
end

def get_japanese_emoticon(a,b)
  # code goes here
  #load_library(a)
  load_library(a)["get_emoticon"].each do|x,y|
    if x==b
      #return y
      puts y
    else
      puts "return Sorry, that emoticon was not found"
    end
  end







end




#load_library('lib/emoticons.yml',"=D")
get_japanese_emoticon('lib/emoticons.yml',"=D")