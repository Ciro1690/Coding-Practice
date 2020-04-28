def average(num_1, num_2)
    total = num_1 + num_2
    average = total/2.0
    average
end

def average_array(array)
    total = 0.0
    array.each do |ele|
        total += ele
    end
    average = total/array.length
    average
end

def repeat(word,num)
    new_word = ""
    num.times {new_word +=word}
    new_word
end

def yell(word)
    new_word = word.upcase + "!"
    new_word
end

def alternating_case(sentence)
    array = sentence.split(" ") 
    new_sentence = array.map.with_index do |word, i|
        if i % 2 == 0
            word.upcase
        else
            word.downcase
        end
    end
    new_sentence.join(" ")
end