require 'yaml'

def load_library(file_path)
  yml_lib = YAML.load_file(file_path)
  emoticons = {"get_emoticon" => {}, "get_meaning" => {}}

  yml_lib.each do |word, emoticons_arr|
    emoticons["get_emoticon"][emoticons_arr[0]] = emoticons_arr[1] #key = eng emoticon, value = japanese emoticon
    emoticons["get_meaning"][emoticons_arr[1]] = word # key = japanese emoticon, value = word
  end

  emoticons
end

def get_japanese_emoticon(file_path, e_emoticon)
  hash = load_library(file_path)

  if hash["get_emoticon"].has_key?(e_emoticon)
    hash["get_emoticon"][e_emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, j_emoticon)
  hash = load_library(file_path)

  if hash["get_meaning"].has_key?(j_emoticon)
   hash["get_meaning"][j_emoticon]
  else
  "Sorry, that emoticon was not found"
  end
end

