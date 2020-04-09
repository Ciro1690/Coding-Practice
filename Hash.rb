def unique_elements(arr) #takes in an array and returns an array with only unique elements
	new_array = []
  	hash = {}
  	arr.each do |ele|
      hash[ele] = 0
    end 
	  hash.each_key do |key|
        new_array << key
      end
  return new_array
end

def element_replace(arr, hash) #takes in an array and a hash, returns an array with elements of the array replaced with corresponding values in the hash.
    new_array = []
    arr.each do |ele|
      if hash.has_key?(ele) == true
          new_array << hash[ele]
      else
        new_array << ele
      end
    end
    return new_array
  end

def map_by_name(arr) #takes in an array of hashes and returns a new array with the name of each hash.
    return arr.map {|hash| hash["name"]}
end

def map_by_key(arr, key) #takes in an array of hashes and returns a new array with the values from each hash for the given key.
	return arr.map {|hash| hash[key]}
end

def yell_sentence(sent) #takes in a string and returns a string where every word is uppercase and has a ! following it.
    arr = sent.split(" ")
  new_arr = arr.map {|word| word.upcase + "! "}
    new_arr.join(" ")

end

def whisper_words(words) #takes an array and returns a new array with each word lowercased and seperated by ...
	new_words = words.map {|word| word.downcase + "..."}
end

def o_words(sentence) #takes a string and returns an array of words containing an "o".
	arr = sentence.split
	new_arr = arr.select{|word| word.include?("o")}
end

def last_index(str, char) #takes in a string and a character, returns the last index with that character in the string.
	i = str.length-1
  	while i >= 0
      if str[i] == char
        return i
      end
      i-=1
    end
end
