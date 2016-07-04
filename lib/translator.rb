# require modules here
require "yaml"

def load_library(file)
emoticon_hash = {
  "get_meaning" => {},
  "get_emoticon" => {},
}

emo_yml = YAML.load_file("#{file}")

emo_yml.each {|emotion, emoticon_array|
emoticon_hash["get_meaning"].merge!(emoticon_array[1] => emotion)
emoticon_hash["get_emoticon"].merge!(emoticon_array[0] => emoticon_array[1])
}

emoticon_hash

end

def get_japanese_emoticon(file, emoticon)
emoticon_hash = load_library(file)

equiv = "Sorry, that emoticon was not found"
emoticon_hash["get_emoticon"].each {|english, japanese|
if emoticon == english
equiv = japanese 
end 
}

equiv
end

def get_english_meaning(file, emoticon)
emoticon_hash = load_library(file)

equiv = "Sorry, that emoticon was not found"
emoticon_hash["get_meaning"].each {|japanese, english_word|
if emoticon == japanese
equiv = english_word
end 
}

equiv

end