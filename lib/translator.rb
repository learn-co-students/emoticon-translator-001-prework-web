require 'yaml'



# emoticon

# require modules here

def load_library (path)
  # code goes here
  emoticon = YAML.load_file(path)

  temp = []
  emoticon.each {|k,v| 
    v.each_with_index {|value, index| 
       temp << value if index == 1
    }
  }
  emoticon_keys = emoticon.keys


  final_hash = {}
  
  
  emoticon_keys.each_with_index { |value,index| final_hash[temp[index]] = value }


  english_emoticon = []
  emoticon.each {|k,v|
    v.each_with_index {|value, index|
      english_emoticon << value if index == 0
    }
  }


get_emoticon_final_hash = {}
temp.each_with_index {|value,index| get_emoticon_final_hash[english_emoticon[index]] = value }

  final = {"get_emoticon" => get_emoticon_final_hash,
    "get_meaning" => final_hash
  }



  return final
   
end



def get_japanese_emoticon (path, emoticon)

final = load_library(path)
  if final['get_emoticon'][emoticon] == nil
    return "Sorry, that emoticon was not found"
  else
    final['get_emoticon'][emoticon]
  end

end

def get_english_meaning (path, emoticon)
  final = load_library(path)
    if final['get_meaning'][emoticon] == nil
      return "Sorry, that emoticon was not found"
    else
      final['get_meaning'][emoticon]
    end
  # code goes here
end

