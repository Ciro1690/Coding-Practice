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