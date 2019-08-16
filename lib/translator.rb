require "yaml"

def load_library(yml_file)
  emoticon_lib = YAML.load_file(yml_file)

  emoticon_hash = {}

  american_arr = []
  japanese_arr = []

  meanings_hash = {}
  english_hash = {}

  emoticon_lib.each do |face_sym, emoji_array|

    english_hash = english_hash.merge(emoji_array[0] => emoji_array[1])
    meanings_hash = meanings_hash.merge(emoji_array[1] => face_sym.to_s)

  end

  emoticon_hash = {
    "get_emoticon" => english_hash,
    "get_meaning" => meanings_hash
  }

  return emoticon_hash
end

def get_japanese_emoticon(yml_file, emoticon)

  emoticon_hash = load_library(yml_file)

  if emoticon_hash["get_emoticon"][emoticon] != nil
    return emoticon_hash["get_emoticon"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(yml_file, emoticon)
  emoticon_lib = YAML.load_file(yml_file)

  emoticon_hash = load_library(yml_file)

  if emoticon_hash["get_meaning"][emoticon] != nil
    return emoticon_hash["get_meaning"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end

end
