# require modules here

require "yaml"

def load_library(file_path)
  library = {"get_meaning" => {}, "get_emoticon" => {} }
  YAML.load_file(file_path).each do |meaning, array|
    english, japanese = array
    library["get_emoticon"][english] = japanese
    library["get_meaning"][japanese] = meaning
  end
  library
end

def get_japanese_emoticon(file_path, english_emoticon)
  library = load_library(file_path)
  output = library["get_emoticon"][english_emoticon]
  if output
    output
  else
    "Sorry, that emoticon was not found"
  end
end


def get_english_meaning(file_path,english_emoticon)
  library = load_library(file_path)
  output = library["get_meaning"][english_emoticon]
  if output
    output
  else
    "Sorry, that emoticon was not found"
  end
end








