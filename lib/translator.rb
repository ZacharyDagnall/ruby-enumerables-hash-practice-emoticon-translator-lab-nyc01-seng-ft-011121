require 'yaml'
require 'pry'

def load_library(filename='lib/emoticons.yml')
  f = YAML.load_file(filename)
  hashedfile = Hash.new
  f.each do |entry|
    emotion = entry[0]
    arr = entry[1]
    hashedfile[emotion] = {english: arr[0], japanese: arr[1]}
  end
 hashedfile 
end



def get_japanese_emoticon(filename, emoticon)
  dictionary = load_library(filename)
  
  dictionary.each do |entry|
    e_j = entry[1]
    if(e_j[:english]==emoticon)
      return e_j[:japanese]
    end
  end
  
  return "Sorry, that emoticon was not found"
  
end



def get_english_meaning(filename, emoticon)
 dictionary = load_library(filename)
  
 dictionary.each do |entry|
    e_j = entry[1]
    binding.pry
    if(e_j[:japanese]==emoticon)
      return e_j[:english]
    end
  end
  
  return "Sorry, that emoticon was not found"
  
end

