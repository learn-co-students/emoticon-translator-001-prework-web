require 'yaml'

def load_library(path)
  original_hash = YAML.load_file(path)
  new_hash = {"get_meaning" => {}, "get_emoticon" => {} }

  original_hash.each do |meaning, emoticon_array|
    new_hash["get_meaning"][emoticon_array[1]] = meaning
    new_hash["get_emoticon"][emoticon_array[0]] = emoticon_array[1]
  end

  new_hash
end

def get_japanese_emoticon(file_path, western_emoticon)
  emoticon_library = load_library(file_path)

  if emoticon_library["get_emoticon"][western_emoticon].nil?
    "Sorry, that emoticon was not found"
  else
    emoticon_library["get_emoticon"][western_emoticon]
  end
end

def get_english_meaning(file_path, japanese_emoticon)
  emoticon_library = load_library(file_path)

  if emoticon_library["get_meaning"][japanese_emoticon].nil?
    "Sorry, that emoticon was not found"
  else
    emoticon_library["get_meaning"][japanese_emoticon]
  end

end

