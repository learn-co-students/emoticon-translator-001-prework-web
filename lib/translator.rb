# require modules here
require 'pry'
require 'yaml'
library = YAML.load_file('lib/emoticons.yml')

def load_library(library)
  library = YAML.load_file('lib/emoticons.yml')
  emo_hash = {'get_meaning' =>{}, 'get_emoticon' => {} }
  library.each do |meaning, emoticon_array|
    emoticon_array.each do |eng, jap|
      emo_hash['get_meaning'].merge!({emoticon_array[1] => meaning})
      emo_hash['get_emoticon'].merge!({emoticon_array[0] => emoticon_array[1]})
      #binding.pry
    end
  end
  emo_hash
end

def get_japanese_emoticon(library, english_emoticon)
  emo_hash = load_library(library)
  if emo_hash['get_emoticon'].keys.include?(english_emoticon)
    output = emo_hash['get_emoticon'][english_emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
  output
end

def get_english_meaning(library, japanese_emoticon)
  # code goes here
  emo_hash = load_library(library)
  if emo_hash['get_meaning'].keys.include?(japanese_emoticon)
    output = emo_hash['get_meaning'][japanese_emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
  output
end