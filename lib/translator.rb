require "yaml"

def load_library(file_path)
  hash = {"get_emoticon" => {}, "get_meaning" => {} }
  YAML.load_file(file_path).each do |meaning, emot_arr|
    english = emot_arr[0]
    japanese = emot_arr[1]
    hash["get_meaning"][japanese] = meaning
    hash["get_emoticon"][english] = japanese
  end
  hash
end

def get_japanese_emoticon(file_path, emoticon)
  hash = load_library(file_path)
  hash["get_emoticon"].each do |eng,jap|
    if eng == emoticon
      return jap
      break
    end
  end
  "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  hash = load_library(file_path)
  hash["get_meaning"].each do |jap_emot,meaning|
    if jap_emot == emoticon
      return meaning
      break
    end
  end
  "Sorry, that emoticon was not found"
end