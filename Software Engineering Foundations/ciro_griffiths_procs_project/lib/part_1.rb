def my_map(array,&prc)
    new_arr = []
    array.each do |ele|
        new_arr << prc.call(ele)
    end
    new_arr
end

def my_select(array,&prc)
    new_arr = []
    array.each do |ele|
        if prc.call(ele)
            new_arr << ele
        end
    end
    new_arr
end

def my_count(array,&prc)
    count = 0
    array.each do |ele|
        if prc.call(ele)
            count +=1
        end
    end
    count
end

def my_any?(array,&prc)
    count = 0
    array.each do |ele|
        if prc.call(ele)
            count +=1
        end
    end
    count > 0
end

def my_all?(array,&prc)
    count = 0
    array.each do |ele|
        if prc.call(ele)
            count +=1
        end
    end
    count == array.length
end

def my_none?(array,&prc)
    count = 0
    array.each do |ele|
        if prc.call(ele)
            count +=1
        end
    end
    count == 0
end