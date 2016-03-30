# require modules here
require "yaml"
def load_library(path)
  file = YAML.load_file(path)
  file.each_with_object({'get_meaning' => {}, 'get_emoticon' => {}}) do |(meaning, emoticons),translations|
    translations["get_meaning"][emoticons[1]] = meaning.to_s
    translations["get_emoticon"][emoticons[0]] = emoticons[1]
  end
end

def get_japanese_emoticon(path, emoticon)
  translations = load_library(path)
  error = "Sorry, that emoticon was not found"
  (translations["get_emoticon"].keys.include?(emoticon)) ? translations["get_emoticon"][emoticon] : error
end

def get_english_meaning(path, emoticon)
  translations = load_library(path)
  error = "Sorry, that emoticon was not found"
  (translations["get_meaning"].keys.include?(emoticon)) ? translations["get_meaning"][emoticon] : error
end

load_library("./lib/emoticons.yml")