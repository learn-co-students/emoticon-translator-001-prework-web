require 'yaml'

def load_library(file_path)
  library = YAML.load_file(file_path)
  emoticon_hash = {'get_meaning'=>{}, 'get_emoticon' => {}}
  library.each do |description, emoticons|
  	emoticon_hash['get_meaning'][emoticons[1]] = description
  	emoticon_hash['get_emoticon'][emoticons[0]] = emoticons[1]
  end
  emoticon_hash
end

def get_japanese_emoticon(file_path, english_emoticon)
  emoticon_hash = load_library(file_path)
  japanese_emoticon = emoticon_hash["get_emoticon"][english_emoticon]
  
  if japanese_emoticon == nil
  	"Sorry, that emoticon was not found"
  else
  	japanese_emoticon
  end
end

def get_english_meaning(file_path, japanese_emoticon)
	emoticon_hash = load_library(file_path)
  english_meaning = emoticon_hash["get_meaning"][japanese_emoticon]

  if english_meaning == nil
  	"Sorry, that emoticon was not found"
  else
  	english_meaning
  end
end