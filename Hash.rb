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

def most_vowels(sentence) #takes in a sentence and returns the word with the most characters.
    hash = {}
    sentence.split.each do |word|
      hash[word] = vowel_count(word)
    end
    sorted = hash.sort_by {|k,v| v}
    return sorted[-1][0]
   
   end

def vowel_count(word)
    vowels = "aeiou"
    count = 0
    word.each_char do |letter|
    if vowels.include?(letter)
        count +=1
    end
    end
    return count
end

def prime?(num) #determines if a number is prime
if num < 2
    return false
end

(2...num).each do |num1|
    if num % num1 == 0
    return false
    end
end
return true
end

def pick_primes(numbers)
new_array = []
numbers.each do |num|
    if prime?(num)
    new_array << num
    end
end
return new_array
end

def prime?(num) #determines if a number is prime
if num < 2
    return false
end

(2...num).each do |num1|
    if num % num1 == 0
    return false
    end
end
return true
end

def pick_primes(numbers) #takes in an array and returns a new array with only prime numbers.
    new_array = []
    numbers.each do |num|
      if prime?(num)
        new_array << num
      end
    end
    return new_array
   end
   
def prime_factors(num) #takes in a number and returns an array of all the prime factors of that number.
array = []
(2...num).each do |num1|
    if num % num1 == 0
     if prime?(num1)
        array << num1
     end
    end
end
return array
end

def greatest_factor_array(arr) #takes in an array and returns the greatest factor for each element. If prime, it just returns the same number.
    new_array = []
     arr.each do |num|
       new_array << greatest_factor(num)
     end
     return new_array  
   end
   
   def greatest_factor(num)
     arr = []
     (1..num).each do |num1|
       if num % num1 == 0
         arr << num1
       end
     end
     if arr[-2] == 1
       return arr[-1]
     else
       return arr[-2]
     end
   end

   def perfect_square?(num) #lets you know if a value is a perfect square.
	(1..num-1).each do |ele|
      if ele * ele == num
        return true
      end
    end
  return false
end

def triple_sequence(start, length) #takes in two values, returns an array of the start multiplied by 3 the length number of times.
	arr = []
  	arr << start
  	length2 = length-1
  	length2.times.each do start *=3
      arr << start
    end
  return arr
  	  
end

def summation_sequence(start, length) #takes in a number and adds the summation to an array length number of times
  array = []  
  i = 0
  array << start
  while i < length-1
    array << sum_num(start)
    i+=1
    start = array[i]
  end
  return array
end

def sum_num(num)
	new_num = 0
  	i = 0
  	while i <= num
      new_num += i
      i+=1
    end
  return new_num
end

def fibonacci(length) #returns the fibonacci value of any number
	if length == 0
      return []
    elsif length == 1
      return [1]
    end
  
    nums = [1,1]
  	while nums.length < length
      last = nums[-1]
      second_to_last = nums[-2]
      element = last + second_to_last
      nums << element
    end
  return nums
end

def caesar_cipher(str, num) #takes in a string and shifts all letters over num indexes in the alphabet.
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  new_str = ""
  str.each_char do |char|
    old = alphabet.index(char)
    new = old+num
    new_num = alphabet[new%26]
    new_str += new_num
  end  
  return new_str
end

def vowel_cipher(string) #takes in a string and returns a new string where each vowel is replaced by the next vowel in the alphabet.
	vowels = "aeiou"
  	new_string = ""
  	string.each_char do |char|
      if vowels.include?(char)
        old_index = vowels.index(char) 
        new_index = old_index + 1 
        new_letter = vowels[new_index%5]
        new_string += new_letter
      else
        new_string += char
      end
    end
    return new_string
end

def double_letter_count(string) #counts the number of times a letter appears twice in a row in a string.
  count = 0
    string.each_char.with_index do |char,i|
      if string[i] == string[i+1]
        count +=1
      end
    end
    return count
  end
  
  def adjacent_sum(arr) #takes in an array and returns a new array with the sums of adjacent numbers.
    new_array = []
    i = 0
     while i < arr.length-1
       new_val = arr[i] + arr[i+1]
       new_array << new_val
     i+=1
     end
    return new_array
  end

  def pyramid_sum(base) #takes an array and returns a 2D array of the adjacent sums of each value.
    array = []
    array << base
    i = 0
      while i < base.length-1
        array.unshift(adjacent_sum(array[0]))
      i+=1
      end
      return array
    end

    def all_else_equal(arr) #takes in an array and returns an element in the array equal to half the sum of the total array, nil otherwise.
      sum = 0
      output = 0
      arr.each do |nums|
        sum += nums
      end
      arr.each_with_index do |nums,i|
        if (sum/2) == nums
          output +=nums
        end
      end
      if (output > 1)
        return output
      else
        return nil
      end
    end
    
    def anagrams?(word1, word2) #returns a boolean indicating if the two inputs are anagrams.
      return hash(word1) == hash(word2)
    end
    
    def hash(word)
      count = Hash.new(0)
      word.each_char {|char| count[char] +=1}
      return count
    end  

    def consonant_cancel(sentence) #takes in a string and returns a new string where all words begin with the first vowel and any consonant before it is removed.
      array = []
    words = sentence.split(" ")
      words.each do |word|
        array << remove_consonant(word)
      end
    return array.join(" ")
  end
  
  def remove_consonant(word)
    vowels = "aeiou"
    word.each_char.with_index do |char,i|
      if vowels.include?(char)
        return word[i..-1]
      end
    end
  end
  