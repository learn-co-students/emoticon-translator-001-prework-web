require 'yaml'
require 'pry'

def load_library(file)
  emoticon_file = YAML.load_file(file)
  emoticon_dic = { "get_meaning" => {}, "get_emoticon" => {} }
  emoticon_file.each_with_object(emoticon_dic) do |(meaning, emoticons), dictionary|
    dictionary["get_emoticon"][emoticons.first] = emoticons.last
    dictionary["get_meaning"][emoticons.last] = meaning
  end
end

def get_japanese_emoticon(file, english_emoticon)
  library = load_library(file)
  japanese_emoticon = library["get_emoticon"][english_emoticon]
  japanese_emoticon == nil ? "Sorry, that emoticon was not found" : japanese_emoticon
end

def get_english_meaning(file, japanese_emoticon)
  library = load_library(file)
  english_emoticon = library["get_meaning"][japanese_emoticon]
  english_emoticon == nil ? "Sorry, that emoticon was not found" : english_emoticon
end


# ORIGINAL METHOD
#
# def load_library(file)
#   loaded_file = YAML.load_file(file)
#   library = { "get_meaning" => {}, "get_emoticon" => {} }
#   loaded_file.each do |meaning, emoticons|
#     library["get_meaning"][emoticons.last] = meaning
#     library["get_emoticon"][emoticons.first] = emoticons.last
#   end
#   library
# end
