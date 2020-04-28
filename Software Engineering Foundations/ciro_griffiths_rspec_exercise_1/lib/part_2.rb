def hipsterfy(word)
    vowels = "aeiou"
    i = word.length-1
    while i >= 0
        if vowels.include?(word[i])
            return word[0...i] + word[i+1..-1]
        end
    i-=1    
    end
    word
end

def vowel_counts(word)
     vowels = "aeiou"
     hash = Hash.new(0)
     new_word = word.downcase
     new_word.each_char do |ele|
         if vowels.include?(ele)
             hash[ele] += 1
         end
     end
     hash
end

def caesar_cipher(word,n)
    new_str = ""
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    word.each_char do |char|
        if alphabet.include?(char)
            old = alphabet.index(char)
            new = old+n
            new_num = alphabet[new%26]
            new_str += new_num
        else
            new_str += char
        end
    end
    new_str
end