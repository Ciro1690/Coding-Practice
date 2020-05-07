def no_dupes?(arr)
    new_array = []
    hash = Hash.new(0)
    arr.map {|k,v| hash[k] +=1}
    hash.each do |k,v|
        if v == 1
            new_array << k
        end
    end
    print new_array
end# Examples
# no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# no_dupes?([true, true, true])            # => []

def no_consecutive_repeats?(arr)
    new_arr = []
    check = true
    arr.each_with_index do |ele,ind|
        arr.each_with_index do |ele2,ind2|
            if ind > ind2 && ind - ind2 == 1
                check = false if ele == ele2
            end
        end
    end
    return check
end
# Examples
# no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
#  no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
#  no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# no_consecutive_repeats?(['x'])                               # => true

def char_indices(str)
    hash = Hash.new {|h,k| h[k] = []}
    array = str.split("")
    array.each_with_index do |char,ind|
        hash[char] << ind
    end
    hash
end

# puts char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# puts char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

def longest_streak(str)
    hash = Hash.new(0)
    arr = str.split("")
    arr.each_with_index do |ele,ind|
        hash[ele] += 1
    end
    most = hash.sort_by{|k,v| v}.last
    print most[0] * most[1]
end

# puts longest_streak('a')           # => 'a'
# puts longest_streak('accccbbb')    # => 'cccc'
# puts longest_streak('aaaxyyyyyzz') # => 'yyyyy
# puts longest_streak('aaabbb')      # => 'bbb'
# puts longest_streak('abc')         # => 'c'

def bi_prime?(num)
    (2...num).each do |ele|
        (2...num).each do |ele2|
            if prime(ele) && prime(ele2)
                return true if ele * ele2 == num
            end
        end
    end
    return false
end

def prime(num)
    (2...num).each do |ele|
        if num % ele == 0
            return false
        end
    end
    return true
end

# puts bi_prime?(22)   # => true
# puts bi_prime?(14)   # => true
# puts bi_prime?(25)   # => true
# puts bi_prime?(94)   # => true
# puts bi_prime?(24)   # => false
# puts bi_prime?(64)   # => false

def vigenere_cipher(message,keys)
    string = ""
    alpha = ("a".."z").to_a
    message.each_char.with_index do |char,i|
        new_ind = (alpha.index(char) + keys[(i%keys.length)]) % 26
        string += alpha[new_ind]
       
    end
    string
end


# puts vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# puts vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# puts vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# puts vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# puts vigenere_cipher("yawn", [5, 1])             # => "dbbo"

def vowel_rotate(str)
    new_str = ""
    count = 0
    vowels = "aeiou"
    array = vowel_array(str)
    str.each_char.with_index do |char,i|
        if vowels.include?(char)
            if count == 0
                 new_vowel = array[-1]
            else   
                 new_vowel = array[count-1]
            end
            count +=1
            new_str += new_vowel
        else
            new_str += char
        end
    end
    new_str
end

def vowel_array(word)
    array = []
    vowels = "aeiou"
    word.each_char do |char|
        if vowels.include?(char)
            array << char
        end
    end
    array
end

# puts vowel_rotate('computer')      # => "cempotur"
# puts vowel_rotate('oranges')       # => "erongas"
# puts vowel_rotate('headphones')    # => "heedphanos"
# puts vowel_rotate('bootcamp')      # => "baotcomp"
# puts vowel_rotate('awesome')       # => "ewasemo"

class String
    def select(&prc)
        return "" if prc.nil?
        new_string = ""
        self.each_char do |char|
            if prc.call(char)
                new_string += char
            end
        end
        new_string
    end

    def map!(&prc)
        self.each_char.with_index do |char,i|
            self[i] = prc.call(char, i)
        end
    end
end

# puts "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
# puts "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
# puts "HELLOworld".select          # => ""

# Examples
word_1 = "Lovelace"
word_1.map! do |ch| 
    if ch == 'e'
        '3'
    elsif ch == 'a'
        '4'
    else
        ch
    end
end
# p word_1        # => "Lov3l4c3"

# word_2 = "Dijkstra"
# word_2.map! do |ch, i|
#     if i.even?
#         ch.upcase
#     else
#         ch.downcase
#     end
# end
# p word_2        # => "DiJkStRa"

def multiply(a,b)
    return 0 if b == 0
    if b > 0
        a + multiply(a,b-1)
    else
        a + multiply(a,b+1)
    end
end

# puts multiply(3, 5)        # => 15
# puts multiply(5, 3)        # => 15
# puts multiply(2, 4)        # => 8
# puts multiply(0, 10)       # => 0
# puts multiply(-3, -6)      # => 18
# puts multiply(3, -6)       # => -18
# puts multiply(-3, 6)       # => -18

def lucas_sequence(num)
    return [] if num == 0
    return [2] if num == 1
    return [2,1] if num == 2
    
    seq = lucas_sequence(num - 1)
    next_ele = seq[-1] + seq[-2]
    seq << next_ele
    seq
end

# print lucas_sequence(0)   # => []
# print lucas_sequence(1)   # => [2]    
# print lucas_sequence(2)   # => [2, 1]
# print lucas_sequence(3)   # => [2, 1, 3]
# print lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
# print lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]

def prime_factorization(num)
   (2...num).each do |fact|
        if num % fact == 0
            other_fact = num/fact
            return [*prime_factorization(fact), *prime_factorization(other_fact)]
        end
    end
    [num]
end    

print prime_factorization(12)     # => [2, 2, 3]
print prime_factorization(24)     # => [2, 2, 2, 3]
print prime_factorization(25)     # => [5, 5]
print prime_factorization(60)     # => [2, 2, 3, 5]
print prime_factorization(7)      # => [7]
print prime_factorization(11)     # => [11]
print prime_factorization(2017)   # => [2017]