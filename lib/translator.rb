require "yaml"

def load_library(file_path)
  new_hash = {'get_meaning' => {}, 'get_emoticon' => {}}
  YAML.load_file(file_path).each do |meaning,emot|
    new_hash['get_meaning'][emot[1]] = meaning
    new_hash['get_emoticon'][emot[0]] = emot[1]
  end
  new_hash
end

def get_japanese_emoticon(file_path,emot)
  load_library(file_path)['get_emoticon'][emot] || sorry
end

def get_english_meaning(file_path,emot)
  load_library(file_path)['get_meaning'][emot] || sorry
end

def sorry
  "Sorry, that emoticon was not found"
end
