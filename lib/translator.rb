require 'yaml'

def load_library(path)
  library = YAML.load_file("#{path}")
  new_hash = {"get_meaning" => {}, "get_emoticon" => {}}
  library.each do |k, v|
    new_hash["get_meaning"][v[1]] = k
    new_hash["get_emoticon"][v[0]] = v[1]
  end
  new_hash
end

def get_japanese_emoticon(path, emoji)
  library = load_library(path)
  if library["get_emoticon"][emoji] == nil
    "Sorry, that emoticon was not found"
  else library["get_emoticon"][emoji]
  end
end

def get_english_meaning(path, emoji)
  library = load_library(path)
  if library["get_meaning"][emoji] == nil
    "Sorry, that emoticon was not found"
  else library["get_meaning"][emoji]
  end
end