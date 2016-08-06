require 'yaml'

ENGLISH = 0
JAPANESE = 1

def load_library(filepath)
  library_hash = YAML.load_file(filepath)
  translator = {"get_meaning" => {},
               "get_emoticon" => {}}

  library_hash.each do |english_meaning, emoticons_list|
    translator["get_meaning"][emoticons_list[JAPANESE]] = english_meaning
    translator["get_emoticon"][emoticons_list[ENGLISH]] = emoticons_list[JAPANESE]
  end

  translator
end

def get_japanese_emoticon(filepath, emoticon)
  translator = load_library(filepath)
  translated = translator["get_emoticon"][emoticon]
  translated ? translated : "Sorry, that emoticon was not found"
end

def get_english_meaning(filepath, emoticon)
  translator = load_library(filepath)
  meaning = translator["get_meaning"][emoticon]
  meaning ? meaning : "Sorry, that emoticon was not found"
end
