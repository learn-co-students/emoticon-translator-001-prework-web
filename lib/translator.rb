require 'yaml'

def load_library(library)
  lib = YAML.load_file(library)
  sorted_lib = {}
  
  sorted_lib["get_meaning"] = {}
  sorted_lib["get_emoticon"] = {}

  lib.each do |meaning, icon|
    sorted_lib["get_meaning"][icon[1]] = meaning
    sorted_lib["get_emoticon"][icon[0]] = icon[1]
  end

  sorted_lib
end

def get_japanese_emoticon(yaml_file, emoticon)
  lib = load_library(yaml_file)

  lib["get_emoticon"].each do |e_emoticon, j_emoticon|
    if e_emoticon == emoticon
      return j_emoticon
    end
  end

  "Sorry, that emoticon was not found"
end

def get_english_meaning(yaml_file, emoticon)
  lib = load_library(yaml_file)

  lib["get_meaning"].each do |j_emoticon, meaning|
    if j_emoticon == emoticon
      return meaning
    end
  end

  "Sorry, that emoticon was not found"
end