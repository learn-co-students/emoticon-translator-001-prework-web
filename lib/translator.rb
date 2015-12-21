require "yaml"

def load_library(file_path)
  table = YAML.load_file(file_path)
  library = Hash.new
  table.each do |meaning, emoticons|
      if library.has_key?("get_meaning")
        library["get_meaning"][emoticons[1]] = meaning
      else
        library["get_meaning"] = {emoticons[1] => meaning}
      end
      if library.has_key?("get_emoticon")
        library["get_emoticon"][emoticons[0]] = emoticons[1]
      else
        library["get_emoticon"] = {emoticons[0] => emoticons[1]}
      end
  end
  library
end

def get_japanese_emoticon(file_path, emoticon)
  library = load_library(file_path)
  if library["get_emoticon"].keys.include?(emoticon)
    return library["get_emoticon"][emoticon]
  else
   "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
    library = load_library(file_path)
  if library["get_meaning"].keys.include?(emoticon)
    return library["get_meaning"][emoticon]
  else
   "Sorry, that emoticon was not found"
  end
end
