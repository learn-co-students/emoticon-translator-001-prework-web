require "yaml"
require "pry"


def load_library(path)
  emoticons = YAML.load_file(path)
  library = {}
  library["get_emoticon"] = {}
  library["get_meaning"] = {}
  emoticons.each do |name, forms|
    library["get_emoticon"][forms[0]] = forms[1]
    library["get_meaning"][forms[1]] = name
  end
  library
end


def get_japanese_emoticon(path, emoticon)
  library = load_library(path)
  return "Sorry, that emoticon was not found" if library["get_emoticon"][emoticon] == nil
  library["get_emoticon"][emoticon]
end


def get_english_meaning(path, emoticon)
  library = load_library(path)
  return "Sorry, that emoticon was not found" if library["get_meaning"][emoticon] == nil
  library["get_meaning"][emoticon]
end