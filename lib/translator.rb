require 'yaml'

def load_library(file)
  library = YAML.load_file(file)

  updated_library = {"get_meaning" => {}, "get_emoticon" => {}}
  
  library.each do |meaning, emoticons|

    updated_library["get_meaning"][emoticons[1]] = meaning
    updated_library["get_emoticon"][emoticons[0]] = emoticons[1]
    
  end

  updated_library
end

def get_japanese_emoticon(file, emoticon)
  library = load_library(file)

  if library["get_emoticon"].keys.include?(emoticon)
    library["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file, emoticon)
  library = load_library(file)

  if library["get_meaning"].keys.include?(emoticon)
    library["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end