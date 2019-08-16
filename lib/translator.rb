require "yaml"

def load_library(path)
  library = YAML.load_file(path)
  new_hash = {}
  get_meaning = {}
  get_emoticon = {}
  library.each do |key, value|
    get_meaning[(value[1])] = key
    get_emoticon[(value[0])] = value[1]
  end
  new_hash["get_meaning"] = get_meaning
  new_hash["get_emoticon"] = get_emoticon
  new_hash
end

def get_japanese_emoticon(path, emoticon)
  hash = load_library(path)
  if hash["get_emoticon"][emoticon] == nil
    return "Sorry, that emoticon was not found"
  else return hash["get_emoticon"][emoticon]
  end
end

def get_english_meaning(path, emoticon)
  hash = load_library(path)
  if hash["get_meaning"][emoticon] == nil
    return "Sorry, that emoticon was not found"
  else return hash["get_meaning"][emoticon]
  end
end
