def partition(array,num)
    array_1 = []
    array_2 = []
    new_array = []
    array.each do |ele|
        if ele < num
            array_1 << ele
        else
            array_2 << ele
        end
    end
    new_array << array_1
    new_array << array_2
    new_array
end

def merge(hash_1,hash_2)
    hash_3 = {}
    hash_1.each do |key, value|
        hash_3[key] = value
    end
    hash_2.each do |key,value|
        hash_3[key] = value
    end
    hash_3
end

def censor(sentence, array)
    new_sent = sentence.split(" ")
    clean_sent = []
        new_sent.each do |word|
            if array.include?(word.downcase)
               clean_sent << vowel_replace(word)
            else
                clean_sent << word
            end
        end
    clean_sent.join(" ")
end

def vowel_replace(word)
    vowels = "aeiou"
    new_word = ""
    word.each_char.with_index do |char|
        if vowels.include?(char.downcase)
            new_word += "*"
        else
            new_word += char
        end
    end
    new_word
end

def power_of_two?(num)
    product = 1
    while product < num
        product *= 2
    end
    product == num  
end