# require modules here
require 'yaml'

def load_library(file_path)
  emos = YAML.load_file(file_path)
  result = {
    'get_emoticon' => {},
    'get_meaning' => {},
  }
  emos.each do |meaning, icons|
    result['get_meaning'][icons[1]] = meaning

    result['get_emoticon'][icons[0]] = icons[1]
  end
  result
end

def get_japanese_emoticon(file_path, emoticon)
  lib = load_library(file_path)
  # if !lib['get_emoticon'].include?(emoticon)
  #   "Sorry, that emoticon was not found"
  # else
  #   lib['get_emoticon'][emoticon]
  # end
  lib['get_emoticon'][emoticon] || "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  lib = load_library(file_path)
  lib['get_meaning'][emoticon] || "Sorry, that emoticon was not found"
  # code goes here
end




