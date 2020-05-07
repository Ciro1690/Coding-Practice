def my_reject(array,&prc)
    new_array = []
    array.each do |ele|
        if !prc.call(ele)
            new_array << ele
        end
    end
    new_array
end

def my_one?(array,&prc)
    count = 0
    array.each do |ele|
        if prc.call(ele)
            count +=1
        end
    end
    if count == 1
        true
    else
        false
    end
end

def hash_select(hash, &prc)
    new_hash = {}
    hash.each do |k,v|
        if prc.call(k,v)
            new_hash[k] = v
        end
    end
    new_hash
end

def xor_select(array, prc1, prc2)
    new_array = []
    array.each do |ele|
        if (prc1.call(ele) || prc2.call(ele)) && !(prc1.call(ele) && prc2.call(ele))
            new_array << ele
        end
    end
    new_array
end

def proc_count(num,array)
    count = 0
    array.each do |proc|
        if proc.call(num)
            count +=1
        end
    end
    count
end
