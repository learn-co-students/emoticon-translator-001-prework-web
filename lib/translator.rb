# require modules here
require "yaml"

def load_library(file_path)
  # code goes here
  emoticons = YAML.load_file(file_path)

  hash = {"get_meaning" => {}, "get_emoticon" => {}}

  emoticons.each do |meaning, icon_array|
    # fill in "get_meaning"
    j_icon = icon_array[1]
    hash["get_meaning"][j_icon] = meaning
    # fill in "get_emoticon"
    e_icon = icon_array[0]
    hash["get_emoticon"][e_icon] = j_icon
  end

  hash
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  dictionary = load_library(file_path)
  new_icon = ""

  dictionary["get_emoticon"].each do |e_icon, j_icon|
    if e_icon == emoticon
      new_icon = j_icon
      break
    else
      new_icon = "Sorry, that emoticon was not found"
    end
  end

  new_icon
end

def get_english_meaning(file_path, emoticon)
  # code goes here
  dictionary = load_library(file_path)
  new_meaning = ""

  dictionary["get_meaning"].each do |j_icon, meaning|
    if j_icon == emoticon
      new_meaning = meaning
      break
    else
      new_meaning = "Sorry, that emoticon was not found"
    end
  end

  new_meaning
end