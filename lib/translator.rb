# require modules here
require "yaml"

def load_library(file_path)

  library = YAML.load_file(file_path)
  hash = {}
  hash["get_meaning"] = {}
  hash["get_emoticon"] = {}

  library.each do |meaning, emojis|
    hash["get_meaning"][emojis[1]] = meaning
    hash["get_emoticon"][emojis[0]] = emojis[1]
  end
  hash
end

def get_japanese_emoticon(file_path, emoticon)
  library = load_library(file_path)
  if library["get_emoticon"].include?(emoticon)
    library["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  library = load_library(file_path)
  if library["get_meaning"].include?(emoticon)
    library["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end