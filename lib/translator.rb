# require modules here
require "yaml"

def load_library(path)
  # code goes here
  data = YAML.load_file(path)
  library = {"get_meaning" => {}, "get_emoticon" => {}}

  data.each do |word, translations|
    library["get_meaning"][translations[1]] = word
    library["get_emoticon"][translations[0]] = translations[1]
  end

  library
end

def get_japanese_emoticon(path, emoticon)
  # code goes here
  library = load_library(path)

  if !library["get_emoticon"].has_key?(emoticon)
    return "Sorry, that emoticon was not found"
  end

  library["get_emoticon"][emoticon]
end

def get_english_meaning(path, emoticon)
  # code goes here
  library = load_library(path)

  if !library["get_meaning"].has_key?(emoticon)
    return "Sorry, that emoticon was not found"
  end

  library["get_meaning"][emoticon]
end