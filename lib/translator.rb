# require modules here
require 'yaml'

def load_library(file)
  # code goes here
  library = YAML.load_file(file)
  organized_lib = {"get_emoticon" => {}, "get_meaning" => {}}
  library.each do |meaning, emots|
    organized_lib["get_emoticon"][emots[0]] = emots[1]
    emots.each do |emot|
      organized_lib["get_meaning"][emot] = meaning
    end
  end
  organized_lib
end

def get_japanese_emoticon(file, eng_emot)
  # code goes here
  get_emots_hash = load_library(file)["get_emoticon"]
  if get_emots_hash.has_key?(eng_emot)
    return get_emots_hash[eng_emot]
  end
  "Sorry, that emoticon was not found"
  #load_library(file).each do |name, emoticons|
    #return emoticons[1] if eng_emot == emoticons[0]
  #end

end

def get_english_meaning(file, jap_emot)
  # code goes here
  get_meaning_hash = load_library(file)["get_meaning"]
  if get_meaning_hash.has_key?(jap_emot)
    return get_meaning_hash[jap_emot]
  end
  "Sorry, that emoticon was not found"
end