require 'yaml'

def load_library(emoticons)
  emoticons = YAML.load_file(emoticons)
  emoticon_hash = {}
  emoticon_hash["get_meaning"] = {}
  emoticon_hash["get_emoticon"] = {}
  emoticons.each do |meaning,values|
    emoticon_hash["get_meaning"][values[1]] = meaning
    emoticon_hash["get_emoticon"][values[0]] = values[1]
  end
  emoticon_hash
end

def get_japanese_emoticon(emoticons, emoticon)
  emoticons = load_library(emoticons)
  emoticons["get_emoticon"].key?(emoticon) ? emoticons["get_emoticon"][emoticon] : "Sorry, that emoticon was not found"
end

def get_english_meaning(emoticons,emoticon)
  emoticons = load_library(emoticons)
  emoticons["get_meaning"].key?(emoticon) ? emoticons["get_meaning"][emoticon] : "Sorry, that emoticon was not found"
end
