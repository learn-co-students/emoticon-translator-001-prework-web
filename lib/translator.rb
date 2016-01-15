require "yaml"

def load_library(path)
  result = YAML.load_file(path)
  hash = {"get_meaning" => {}, "get_emoticon" => {}}
  result.each do |meaning, emoticons|
    hash["get_meaning"][emoticons[1]] = meaning
    hash["get_emoticon"][emoticons[0]] = emoticons[1]
  end
  hash
end

def get_japanese_emoticon(path, emoticon)
  hash = load_library(path)
  hash["get_emoticon"][emoticon] || "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emoticon)
  hash = load_library(path)
  hash["get_meaning"][emoticon] || "Sorry, that emoticon was not found"
end