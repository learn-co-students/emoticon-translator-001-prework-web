# require modules here
require 'yaml'
require 'pry'


def load_library (filePath)

  yaml= YAML.load_file(filePath)
  dictionary={"get_meaning"=>{}, "get_emoticon"=>{}}
  yaml.each do |meaning,emoticons|
    dictionary["get_meaning"][emoticons[1]]=meaning
    dictionary["get_emoticon"][emoticons[0]]=emoticons[1]
  end
  dictionary
end

def get_japanese_emoticon (filePath,emoticon)
dictionary=load_library(filePath)
  if dictionary["get_emoticon"].has_key?(emoticon)
dictionary["get_emoticon"][emoticon]
else
  "Sorry, that emoticon was not found"
 end
end

def get_english_meaning (filePath,emoticon)
  dictionary=load_library(filePath)
  if dictionary["get_meaning"].has_key?(emoticon)
dictionary["get_meaning"][emoticon]
else
  "Sorry, that emoticon was not found"
 end
end