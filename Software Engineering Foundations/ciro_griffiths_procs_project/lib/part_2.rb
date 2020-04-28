def reverser(str,&prc)
    new_str = ""
    new_str += prc.call(str.reverse)
    new_str
end

def word_changer(sentence,&prc)
    new_sent = []
    array = sentence.split(" ")
    array.each do |word|
        new_sent << prc.call(word)
    end
    new_sent.join(" ")
end

def greater_proc_value(num, prc, prc2)
    num_1 = prc.call(num)
    num_2 = prc2.call(num)
    if num_1 > num_2
        num_1
    else
        num_2
    end
end

def and_selector(array,prc,prc2)
    new_array = []
    array.each do |ele|
        if prc.call(ele) && prc2.call(ele)
            new_array << ele
        end
    end
    new_array
end

def alternating_mapper(array,prc,prc2)
    new_array = []
    array.each_with_index do |ele,ind|
        if ind % 2 == 0
            new_array << prc.call(ele)
        else
            new_array << prc2.call(ele)
        end
    end
    new_array
end