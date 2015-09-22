# require modules here
require "yaml"

def load_library(yaml)
  emoticons = {"get_meaning" => {}, "get_emoticon" => {} }
  YAML.load_file('./lib/emoticons.yml').each do |meaning, array|
    english, japanese = array
    emoticons["get_meaning"][japanese] = meaning
    emoticons["get_emoticon"][english] = japanese
  end
  emoticons
end

def get_japanese_emoticon(yaml, emoticon)
  load_library = load_library('./lib/emoticons.yml')
  result = load_library["get_emoticon"][emoticon]
    if result
      result  
    else 
      "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(yaml, emoticon)
  load_library = load_library('./lib/emoticons.yml')
  result = load_library["get_meaning"][emoticon]
  if result
    result
  else 
    "Sorry, that emoticon was not found"
  end
end