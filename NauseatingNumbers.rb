require 'byebug'

def strange_sums(nums)
    count = 0
    nums.each_with_index do |num_1,ind1|
        nums.each_with_index do |num_2,ind2|
            if (ind1> ind2) && (num_1 + num_2 == 0)
                count +=1
            end
        end
    end
    count
end

def pair_product(nums,product)
    nums.each_with_index do |num,ind|
        nums.each_with_index do |num2,ind2|
            return true if ind>ind2 && num * num2 == product
        end
    end
    false
end

def rampant_repeats(str,hash)
    new_str = ""
    str.each_char do |char|
        if hash[char].nil?
            new_str += char
        else
            new_str += char * hash[char]
        end
    end
    new_str
end

def perfect_square(num)
    (0..num).each do |factor|
        return true if factor * factor == num
    end
    return false
end

def anti_prime?(num)
    (1...num).each do |other_num|
        return false if divisor_count(other_num) > divisor_count(num)
    end
    true
end

def divisor_count(num)
    count = 0
    (1..num).each do |divisor|
        count +=1 if num %  divisor == 0
    end
    count
end

def matrix_addition(matrix1,matrix2)
   height = matrix1.length
   width = matrix1[0].length
   result = Array.new(height) { [0] * width }

   (0...height).each do |row|
        (0...width).each do |col|
            result[row][col] = matrix1[row][col] + matrix2[row][col]
        end
    end
    result
end

def mutual_factors(*nums)
    nums
        .map { |n| factors(n) }
        .inject(:&)
end

def factors(num)
    array = []
    (1..num).each do |factor|
        if num % factor == 0
            array << factor
        end
    end
    array
end

def tribonacci_number(num)
    return 1 if num == 1
    return 1 if num == 2
    return 2 if num == 3
    tribonacci_number(num-3) + tribonacci_number(num-2) + tribonacci_number(num-1)
end

def matrix_addition_reloaded(*matrices)
    matrix = matrices.first
    height = matrix.length
    width = matrix[0].length

    empty_matrix = Array.new(height) { [0] * width }
    matrices.inject(empty_matrix) do |m1, m2|
        return nil if m2.length != height or m2[0].length != width
        matrix_addition(m1, m2)
    end

end

def squarocol?(grid)
    return true if grid.any? { |row| row.uniq.length == 1 }
    return true if grid.transpose.any? { |col| col.uniq.length == 1 }
    false
end

def pascals_triangle(n)
    array = [[1]]
    while array.length < n
            level_above = array.last
            next_level = [1]
            next_level += adj_sum(level_above)
            next_level << 1
            array << next_level
    end
    array
end

def adj_sum(array)
    sums = []
    (0...array.length-1).each do |i|
        sums << array[i] + array[i+1]
    end
    sums
end

def mersenne_prime(num)
    count = 0
    x = 1
    while count < num
        x+=1
        candidate = 2**x - 1
        count +=1 if is_prime?(candidate)
    end
    2**x - 1
end

def is_prime?(num)
    (2...num).each do |factor|
        if num % factor == 0
            return false
        end
    end
    return true
end

def triangular_word?(word)
    value = word_value(word)
    i = 1
    candidate = 1
    while candidate < value
        i+=1
        candidate = (i * (i + 1)) / 2
        return true if candidate == value
    end
    false
end

def word_value(word)
    alpha = ("a".."z").to_a
    value = 0
    word.each_char.with_index do |char,i|
        value += (alpha.index(char) + 1) %26
    end
    value
end
