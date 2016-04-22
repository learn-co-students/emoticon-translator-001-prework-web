require 'yaml'

# require modules here

def load_library(file_path)
  # code goes here
  library = YAML.load_file(file_path)
  get_meaning = Hash.new
 get_emoticon = Hash.new
 library.each do |meaning, emoticon|
  get_meaning[emoticon[1]] = meaning
  get_emoticon[emoticon[0]] = emoticon[1]
end
{"get_meaning" => get_meaning, "get_emoticon" => get_emoticon}
end

def get_japanese_emoticon(file_path, emoticon)
 library = load_library(file_path)
  if library["get_emoticon"][emoticon]
    library["get_emoticon"][emoticon]
  else
      return "Sorry, that emoticon was not found"
  end
end   

def get_english_meaning(file_path, emoticon)
  # code goes here
  library = load_library(file_path)
   if library["get_meaning"][emoticon]
     library["get_meaning"][emoticon]
   else
     return "Sorry, that emoticon was not found"
  end
end