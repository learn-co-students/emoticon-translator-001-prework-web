# require modules here
require "yaml"

def load_library(file_path)
  # code goes here
    hash = YAML.load_file(file_path)
    get_emoticon = Hash.new
    get_meaning = Hash.new
    hash.each do |meaning, emo_arr|
        get_meaning[emo_arr[1]] = meaning
        get_emoticon[emo_arr[0]] = emo_arr[1]
    end
    {"get_emoticon" => get_emoticon, "get_meaning" => get_meaning}
end

def get_japanese_emoticon(file_path, eng_emo)
  # code goes here
    hash = load_library(file_path)
    if hash["get_emoticon"].keys.include?(eng_emo)
        hash["get_emoticon"][eng_emo]
    else
        "Sorry, that emoticon was not found"
    end
end

def get_english_meaning(file_path, jap_emo)
  # code goes here
    hash = load_library(file_path)
    if hash["get_meaning"].keys.include?(jap_emo)
        hash["get_meaning"][jap_emo]
    else
        "Sorry, that emoticon was not found"
    end
end