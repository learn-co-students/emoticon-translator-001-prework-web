# require modules here
require "yaml"

def load_library(file_path)
  # code goes here
	hash = {"get_meaning" => {}, "get_emoticon" => {}}
	emoticons = YAML.load_file(file_path)	
	emoticons.each do |k,v|
		hash["get_meaning"][v[1]] = k
		hash["get_emoticon"][v[0]] = v[1]
	end
	hash
end


def get_japanese_emoticon(file_path, en_emot)
	emots = load_library(file_path)
	if emots["get_emoticon"][en_emot]
		emots["get_emoticon"][en_emot]
	else
		return "Sorry, that emoticon was not found"
	end
end

def get_english_meaning(file_path, jp_emot)
	emots = load_library(file_path)
	if emots["get_meaning"][jp_emot]
		emots["get_meaning"][jp_emot]
	else
		return "Sorry, that emoticon was not found"
	end
end
