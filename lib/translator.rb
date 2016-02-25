require 'yaml'


def load_library(file_path)
  emoticons = YAML.load_file(file_path)

  new_hash = {}
  new_hash["get_meaning"] = {}
  new_hash["get_emoticon"] = {}

  emoticons.each_with_object(new_hash) do |item|
    new_hash["get_meaning"][item.last.last] = item.first
    new_hash["get_emoticon"][item.last.first] = item.last.last
  end

  new_hash
end


def get_japanese_emoticon(file_path, english_emoticon)
  library = load_library(file_path)

  if library["get_emoticon"].include?(english_emoticon)
    library["get_emoticon"][english_emoticon]
  else 
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, japanese_emoticon)
  library = load_library(file_path)

  if library["get_meaning"].include?(japanese_emoticon)
    library["get_meaning"][japanese_emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end