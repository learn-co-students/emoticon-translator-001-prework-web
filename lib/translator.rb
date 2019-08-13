# require modules here
require "yaml"
path = '~/code/labs/emoticon-translator-001-prework-web/lib/emoticons.yml'
def load_library(path)
  # code goes here
    test = YAML.load_file(path)
    hash = {}
    hash["get_emoticon"] = {}
    hash["get_meaning"] = {}

    test.each do |k,v|
        # k is the meaning
        #make 'get emoticon'
        japan = test[k][1]
        hash["get_meaning"][japan] = k
        emoji = test[k][0]
        hash["get_emoticon"][emoji] = japan
    end
    hash
end

def get_japanese_emoticon(path, emoji)
  # code goes here
  hash = load_library(path)
  hash["get_emoticon"].each do |k,v|
      if k == emoji
        return v
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emoji)
  # code goes here
  hash = load_library(path)
    hash["get_meaning"].each do |k,v|
          if k == emoji
            return v
        end
    end
    return "Sorry, that emoticon was not found"
end