require 'yaml'
require 'pry'

def load_library(filePath)
	library = YAML.load_file(filePath)  
	get_meaning = Hash.new
	get_emoticon = Hash.new

	library.each do |meaning, emoticons|
		get_meaning[emoticons[1]] = meaning
		#get_meaning => {japEmo: meaning}
		get_emoticon[emoticons[0]] = emoticons[1]
		#get_emoticon => {engEmo: japEmo}
	end
	{"get_meaning" => get_meaning, "get_emoticon" => get_emoticon}
end

def get_japanese_emoticon(filePath, emoticon)
	library = load_library(filePath)
	if library["get_emoticon"][emoticon]
		library["get_emoticon"][emoticon]
	else
		return "Sorry, that emoticon was not found"
	end
end

def get_english_meaning(filePath, emoticon)
	library = load_library(filePath)
	if library["get_meaning"][emoticon]
		#return value for [emotion] key
		library["get_meaning"][emoticon]
	else 
		return "Sorry, that emoticon was not found"
	end
end

