require "yaml"

def load_library(path)
  new_hash = {}
  emoticons = YAML.load_file(path)
  new_hash["get_meaning"] = {}
  new_hash["get_emoticon"] = {}
  for i in 0..emoticons.length - 1
    new_hash["get_meaning"][emoticons.values[i][1]] = emoticons.keys[i]
    new_hash["get_emoticon"][emoticons.values[i][0]] = emoticons.values[i][1]
  end
  new_hash
end

def get_japanese_emoticon(path, emoticon)
  answer = load_library("./lib/emoticons.yml")
  result = "Sorry, that emoticon was not found"
  for i in 0..answer["get_emoticon"].length - 1
    if answer["get_emoticon"].keys[i] == emoticon
      result = answer["get_emoticon"].values[i]
    end
  end
  result
end

def get_english_meaning(path, emoticon)
  answer = load_library("./lib/emoticons.yml")
  result = "Sorry, that emoticon was not found"
  for i in 0..answer["get_meaning"].length - 1
    if answer["get_meaning"].keys[i] == emoticon
      result = answer["get_meaning"].values[i]
    end
  end
  result
end