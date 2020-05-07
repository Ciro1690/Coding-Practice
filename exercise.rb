def zip(*array)
    length = array.first.length
    (0...length).map do |i|
        array.map {|array|array[i]}
    end
end

def prizz_proc(array,prc1,prc2)
    new_array = []
    array.each do |ele|
        if (prc1.call(ele) && !prc2.call(ele)) || (prc2.call(ele) && !(prc1.call(ele)))
            new_array << ele
        end
    end
    new_array
end

def zany_zip(*array)
    length = array.map(&:length).max
    (0...length).map do |i|
        array.map{|array|array[i]}
    end
end

def maximum(array, &prc)
    max = array.first
    return nil if array.length == 0
    array.each do |ele|
        max = ele if prc.call(ele) >= prc.call(max)
    end
    max
end

def my_group_by(array,&prc)
    hash = Hash.new{|h,k| h[k] = []}
    array.each do |ele|
        key = prc.call(ele)
        hash[key] << ele
    end
    hash
end

def max_tie_breaker(array,tie_breaker,&prc)
    return nil if array.empty?
    max = array.first
    array.each do |ele|
        if prc.call(ele) > prc.call(max)
            max = ele
        elsif prc.call(ele) == prc.call(max)
            max = ele if tie_breaker.call(ele) > tie_breaker.call(max)
        end
    end
    max
end

def silly_syllables(sent)
    new_sent = []
    array = sent.split(" ")
    array.each do |word|
        new_sent << change_word(word)
    end
    new_sent.join(" ")
end

def indices(word)
    index = []
    vowels = "aeiou"
    word.each_char.with_index do |char,ind|
        index << ind if vowels.include?(char)
    end
    index
end

def change_word(word)
    array = indices(word)
    if array.length < 2
        word
    else
        word[array.first..array.last]
    end
end

