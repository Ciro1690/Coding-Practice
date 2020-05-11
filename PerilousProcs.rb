def some?(array,&prc)
    array.any? {|ele| prc.call(ele)}
end

def exactly?(array,num,&prc)
    count = 0
    array.each do |ele|
        count +=1 if prc.call(ele)
    end
    count == num
end

def filter_out(array,&prc)
    new_array = []
    array.each do |ele|
        new_array << ele if !prc.call(ele)
    end
    new_array
end

def at_least?(array,num,&prc)
    count = 0
    array.each do |ele|
        count +=1 if prc.call(ele)
    end
    count >= num
end

def every?(array,&prc)
    array.all?{|ele| prc.call(ele)}
end

def at_most?(array,n,&prc)
    count = 0
    array.each do |ele|
        count +=1 if prc.call(ele)
    end
    count <= n
end

def first_index(array,&prc)
    array.each_with_index do |ele,ind|
        return ind if prc.call(ele)
    end
    nil
end

def xnor_select(array,prc1,prc2)
    new_array = []
    array.each do |ele|
        new_array << ele if (prc1.call(ele) && prc2.call(ele)) || (!prc1.call(ele) && !prc2.call(ele))
    end
    new_array
end

def filter_out!(array,&prc)
    array.uniq.each {|ele|array.delete(ele) if prc.call(ele)}
end

def multi_map(array,n=1,&prc)
    new_array = []
    array.each do |ele|
        n.times {ele = prc.call(ele)}
            new_array << ele
    end
    new_array
end

def proctition(array,&prc)
    new_array = []
    array.each do |ele|
        new_array << ele if prc.call(ele)
    end
    array.each do |ele|
        new_array << ele if !prc.call(ele)
    end
    new_array
end

def selected_map!(array,prc1,prc2)
    array.each_with_index do |ele,ind|
        if prc1.call(ele)
            array[ind] = prc2.call(ele)
        end
    end
    nil
end

def chain_map(num,array)
    array.inject(num) {|acc,prc| prc.call(acc)}
end

def proc_suffix(sent,hash)
    new_sent = []
    array = sent.split(" ")
    array.each do |word|
        new_word = word
        hash.each do |prc,suffix|
            new_word += suffix if prc.call(word)
        end
        new_sent << new_word
    end
    new_sent.join(" ")
end

def proctition_platinum(array,*prcs)
    hash = {}
    prcs.each_index {|i| hash[i+1] = []}
        array.each do |ele|
            prcs.each_with_index do |prc,ind|
                if prc.call(ele)
                    hash[ind+1] << ele
                    break
                end
            end
        end
    hash
end

def procipher(sent,hash)
    words = sent.split(" ")
    new_words = words.map do |word|
        new_word = word
        hash.each do |k,v|
            new_word = v.call(word) if k.call(word)
        end
        new_word
    end
    new_words.join(" ")
end

def picky_procipher(sent,hash)
    words = sent.split(" ")
    new_words = words.map do |word|
        new_word = word
        hash.each do |k,v|
            if k.call(word)
                new_word = v.call(word)
                break
            end 
        end
        new_word
    end
    new_words.join(" ")
end