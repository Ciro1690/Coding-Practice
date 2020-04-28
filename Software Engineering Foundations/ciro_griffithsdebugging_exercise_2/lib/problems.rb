# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.
require "byebug"
def largest_prime_factor(num)
    num.downto(2).each do |factor|
        if num % factor == 0 && prime?(factor)
            return factor
        end
    end
end

def prime?(num)
    return false if num < 2
    (2...num).each do |factor|
        if num % factor == 0
            return false
        end
    end
    return true
end

def unique_chars?(str)
    seen = []
    str.each_char do |char|
        if seen.include?(char)
            return false
        end
        seen << char
    end
    true    
end

def dupe_indices(array)
    hash = Hash.new{|h,k| h[k] = []}
    array.each_with_index do |ele,ind|
        hash[ele] << ind
    end
    hash.select{|ele,arr| arr.length > 1}
end

def ana_array(arr_1,arr_2)
    if ele_count(arr_1) == ele_count(arr_2)
        return true
    else
        return false
    end
end

def ele_count(array)
    hash = Hash.new(0)
    array.each {|ele| hash[ele] +=1} 
    hash
end