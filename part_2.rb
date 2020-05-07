def proper_factors(num)
    array = []
    (1...num).each do |factor|
        if num % factor == 0
            array << factor
        end
    end
    array
end

def aliquot_sum(num)
    count = 0
    proper_factors(num).each do |ele|
        count += ele
    end
    count
end

def perfect_number?(num)
    if aliquot_sum(num) == num
        true
    else
        false
    end
end

def ideal_numbers(n)
    array = []
    count = 0
    i = 0
    while count < n
        if perfect_number?(i)
            count << i
        end
        i+=1
    end
    array
end