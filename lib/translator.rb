# require modules here
require "yaml"
def load_library(abc)
  emo= YAML.load_file(abc)
   xyz={"get_meaning" => {}, "get_emoticon" => {}}
  emo.each do |i,g|
    xyz["get_meaning"][g[1]]= i
    xyz["get_emoticon"][g[0]] = g[1]
  end
    return xyz
  # code goes here
end

def get_japanese_emoticon(a,b)
  xyz=load_library(a)["get_emoticon"]
  xyz.each do|x,y|
    if x==b
      return y
    elsif xyz.has_key?(b)==false
      return "Sorry, that emoticon was not found"
    end
  end
end

def get_english_meaning(a,b)
  xyz=load_library(a)["get_meaning"]
  xyz.each do|x,y|
    if x==b
      return y
    elsif xyz.has_key?(b)==false
      return "Sorry, that emoticon was not found"
    end
  end
end