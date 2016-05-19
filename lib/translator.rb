require "yaml" 

def load_library(file)
  emoticons_library = {"get_meaning" => {}, "get_emoticon" => {}}
  YAML.load_file("#{file}").each do |meaning, emoticons|
    emoticons_library["get_meaning"][emoticons[1]] = meaning
    emoticons_library["get_emoticon"][emoticons[0]] = emoticons[1]
  end
  emoticons_library
end

def get_japanese_emoticon(filepath, emoticon)
  library = load_library(filepath)
  library.each do |get, translation_hash|
    translation_hash.each do |emote, translation|
      if emote == emoticon
        return translation
      end
    end
  end
  "Sorry, that emoticon was not found"
end

def get_english_meaning(filepath, emoticon)
  library = load_library(filepath)
  library.each do |get, translation_hash|
    translation_hash.each do |emote, translation|
      if emote == emoticon
        return translation
      end
    end
  end
  "Sorry, that emoticon was not found"
end