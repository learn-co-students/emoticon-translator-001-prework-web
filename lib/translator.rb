require "yaml"


def load_library(file_path)
  emoticon_hash = {}
  get_emoticon = "get_emoticon"
  get_meaning = "get_meaning"
  emoticon_hash[get_emoticon] = {}
  emoticon_hash[get_meaning] = {}
  emoticons = YAML.load_file(file_path)
  emoticons.each do |meaning, emoticon|
    emoticon.each do |array|
      emoticon_hash[get_emoticon][emoticon[0]] = emoticon[1] #English emote to Japanese
      emoticon_hash[get_meaning][emoticon[1]] = meaning #description of Japanese emote
    end
  end
  emoticon_hash
end

def get_japanese_emoticon(file_path, emoticon)
  emoticons = load_library(file_path)
  if emoticons["get_emoticon"][emoticon] == nil
    "Sorry, that emoticon was not found"
  else
    emoticons["get_emoticon"][emoticon]
  end
end

def get_english_meaning(file_path, emoticon)
  emoticons = load_library(file_path)
  if emoticons["get_meaning"][emoticon] == nil
    "Sorry, that emoticon was not found"
  else
    emoticons["get_meaning"][emoticon]
  end
end