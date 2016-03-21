require 'yaml'

def load_library(path)
  emoticons = YAML.load_file(path)

  updated_hash = { "get_meaning" => {}, "get_emoticon" => {}}
  english_emoticon = nil

  emoticons.each do |literal_meaning, emoticon_array|
    emoticon_array.each_with_index do |icon, idx|
      if idx == 0
        english_emoticon = icon
      else
        updated_hash["get_meaning"][icon] = literal_meaning
        updated_hash["get_emoticon"][english_emoticon] = icon
      end
    end
  end
  updated_hash
end

def get_japanese_emoticon(path, english_emoticon)
  emoticon_hash = load_library(path)

  unless emoticon_hash["get_emoticon"].keys.include?(english_emoticon)
    return "Sorry, that emoticon was not found"
  end

  emoticon_hash["get_emoticon"][english_emoticon]
end

def get_english_meaning(path, japanese_emoticon)
  emoticon_hash = load_library(path)

  unless emoticon_hash["get_meaning"].keys.include?(japanese_emoticon)
    return "Sorry, that emoticon was not found"
  end

  emoticon_hash["get_meaning"][japanese_emoticon]
end
