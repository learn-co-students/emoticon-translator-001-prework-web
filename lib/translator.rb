# require modules here
require "yaml"

def load_library(file)
  library = YAML.load_file(file)
  dictionary = {"get_meaning" => {}, "get_emoticon" => {}}
  library.each do |meaning, emoticons|
  	english = emoticons[0]
  	japanese = emoticons[1]
  	dictionary["get_meaning"][japanese] = meaning
  	dictionary["get_emoticon"][english] = japanese
  end
  dictionary
end

def get_japanese_emoticon(file, emoticon)
  dictionary = load_library(file)
  if !dictionary["get_emoticon"].has_key?(emoticon)
  	return "Sorry, that emoticon was not found"
  else
  	return dictionary["get_emoticon"][emoticon]
  end
end

def get_english_meaning(file, emoticon)
  dictionary = load_library(file)
  if !dictionary["get_meaning"].has_key?(emoticon)
  	return "Sorry, that emoticon was not found"
  else
  	return dictionary["get_meaning"][emoticon]
  end
end