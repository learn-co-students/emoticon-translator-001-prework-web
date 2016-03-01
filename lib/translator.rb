require 'pry'
# require modules here
require 'yaml'

def load_library(filepath)
  library = {'get_meaning' => {}, 'get_emoticon' => {}}

  # iterate over the library and put the japanese emoticon into
  # hash get meaning as keys, with words assigned as values
  # also set english emoticons as keys with japanese emoticons 
  # as values
  #binding.pry

  (YAML.load_file(filepath)).each do |word, emoticon_pair|
    library['get_meaning'].merge!(emoticon_pair[1] => word)
    library['get_emoticon'].merge!(emoticon_pair[0] => emoticon_pair[1])
  end
  library
end

def get_japanese_emoticon(filepath, emoticon)
  library = load_library(filepath)
  return "Sorry, that emoticon was not found" if (!(library['get_emoticon'].include?(emoticon)))
  library['get_emoticon'][emoticon]
end

def get_english_meaning(filepath, emoticon)
  library = load_library(filepath)
  return "Sorry, that emoticon was not found" if (!(library['get_meaning'].include?(emoticon)))
  library['get_meaning'][emoticon]
end