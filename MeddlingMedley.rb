require 'byebug'

def duos(str)
    count = 0
    str.each_char.with_index do |char,ind|
        count +=1 if char == str[ind+1]
    end
    count
end

def sentence_swap(sent,hash)
    new_sent = []
    array = sent.split(" ")
    array.each do |word|
        if hash[word].nil?
            new_sent << word
        else
            new_sent << hash[word]
        end
    end
    new_sent.join(" ")
end

def hash_mapped(hash,proc, &prc)
    new_hash = {}
    hash.each do |k,v|
        new_hash[prc.call(k)] = proc[v]
    end
    new_hash
end

def counted_characters(str)
    counts = Hash.new(0)
    arr = str.split("")
    arr.each {|char|counts[char] +=1}
    counts = counts.select {|k,v| v > 2}
    counts.keys
end

def triplet_true(str)
    str.each_char.with_index do |char,ind|
        return true if char == str[ind+1] && char == str[ind+2]
    end
    return false
end

def energetic_encoding(str,hash)
    new_str = ""
    str.each_char do |char|
        if !hash[char].nil?
            new_str += hash[char]
        elsif char == " "
            new_str += char
        else
            new_str += "?"
        end
    end
    new_str
end

def uncompress(str)
    new_str = ""
    str.each_char.with_index do |char,ind|
        if ind % 2 == 0
            str[ind+1].to_i.times {new_str += char}
        end
    end
    new_str
end

def conjunct_select(array, *prcs)
    array.select {|ele| prcs.all?{|prc|prc.call(ele)}}
end

def convert_pig_latin(sent)
    new_sent = []
    array = sent.split(" ")
    array.each do |word|
        if word.length < 3
            new_sent << word
        elsif first_vowel(word)
            new_sent << word + "yay"
        else
            new_sent << later_vowel(word)
        end
    end
    new_sent.join(" ")
end

def first_vowel(word)
    vowels = "aeiou"
    return true if vowels.include?(word.downcase[0])
end

def later_vowel(word)
    vowels = "aeiou"
    new_word = ""
    word.each_char.with_index do |char,ind|
        if vowels.include?(char)
            start = word[0..ind-1]
            ending = word[ind..-1]
            new_word += ending + start + "ay"
            break
        end
    end
    new_word
end

def reverberate(sent)
    new_sent = []
    vowels = "aeiou"
    array = sent.split(" ")
    array.each do |word|
        if word.length < 3
            new_sent << word
        elsif vowels.include?(word[-1])
            new_sent << word + word.downcase
        else
            new_sent << non_vowel(word)
        end
    end
    new_sent.join(" ")
end

def non_vowel(word)
    vowels = "aeiou"
    new_word = ""
    i = word.length
    while i > 0
        if vowels.include?(word[i-1])
            new_word += word + word[i-1..-1]
            break
        end
    i-=1
    end
    new_word
end

def disjunct_select(array,*prcs)
    array.select {|ele| prcs.one?{|prc|prc.call(ele)}}    
end

def alternating_vowel(sent)
    new_sent = []
    array = sent.split(" ")
    array.each_with_index do |word,ind|
        if ind % 2 == 0
            new_sent << first_vowel(word)
        else
            new_sent << last_vowel(word)
        end
    end
    new_sent.join(" ")
end

def first_vowel(word)
    vowels = "aeiou"
    new_word = ""
    word.each_char.with_index do |char,ind|
        if vowels.include?(char)
            new_word += word[0..ind-1] + word[ind+1..-1]
            break
        end
    end
    new_word
end

def last_vowel(word)
    vowels = "aeiou"
    new_word = ""
    i = word.length
    while i > 0
        if vowels.include?(word[i-1])
            new_word +=  word[0..i-2] + word[i..-1]
            break
        end
    i-=1
    end
    new_word
end

def silly_talk(sent)
    new_sent = []
    vowels = "aeiou"
    array = sent.split(" ")
    new_word = ""
    array.each_with_index do |word,ind|
        if vowels.include?(word[-1])
            new_sent << word + word[-1]
        else
            new_sent << b_replace(word)
        end
    end
    new_sent.join(" ")
end

def b_replace(word)
    new_word = ""
    vowels = "aeiouAEIOU"
    word.each_char do |char|
        if vowels.include?(char)
            new_word += char + "b" + char.downcase
        else
            new_word += char
        end
    end
    new_word
end

def compress(str)
    new_str = ""
    hash = Hash.new(0)
    str.each_char do |char|
        hash[char] += 1
    end
    hash.each do |k,v|
       new_str += k
       if v > 1
            new_str += v.to_s
       end
    end
    new_str
end