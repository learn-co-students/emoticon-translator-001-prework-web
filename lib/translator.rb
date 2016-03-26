require "yaml"

#lib
#angel => ["U.S.", "Japan"]

#get_meaning

#"Japan" => angel

#get_emoticon

#"O:)" => "☜(⌒▽⌒)☞"


def load_library(lib)
  emoticons = YAML.load_file(lib)

  get_meaning = {}
  get_emoticon = {}

  emoticons.each do |hashKey, hashValueArray|
    get_meaning[hashValueArray[1]] = hashKey
  end

  emoticons.each do |hashKey, hashValueArray|
    get_emoticon[hashValueArray[0]] = hashValueArray[1]
  end

  libHash = {"get_meaning" => get_meaning, "get_emoticon" => get_emoticon}

end

def get_japanese_emoticon(lib, emoticon)
  emoticons = load_library(lib)

  emoticonHash = emoticons["get_emoticon"]

  emoticonResult = ""

  if emoticonHash.keys.include?(emoticon)
    emoticonHash.each do |english, japanese|
      if english == emoticon
        emoticonResult = japanese
      end
    end
  else
    emoticonResult = "Sorry, that emoticon was not found"
  end
  emoticonResult
end

def get_english_meaning(lib, emoticon)
  emoticons = load_library(lib)

  emoticonHash = emoticons["get_meaning"]

  emoticonResult = ""

  if emoticonHash.keys.include?(emoticon)
    emoticonHash.each do |japanese, meaning|
      if japanese == emoticon
        emoticonResult = meaning
      end
    end
  else
    emoticonResult = "Sorry, that emoticon was not found"
  end
  emoticonResult
end