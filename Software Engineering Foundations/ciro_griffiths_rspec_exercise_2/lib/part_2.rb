def  palindrome?(string)
    new_string = ""
    string.each_char do |char|
        new_string.insert(0,char)
    end
    if new_string == string
        return true
    else
        return false
    end
end

def substrings(string)
    array = []
    (0...string.length).each do |start_index|
        (start_index...string.length).each do |end_index|
            array << string[start_index..end_index]
        end
    end
    array
end

def palindrome_substrings(string)
    # array = []
    # sub_array = substrings(string)
    # sub_array.each do |ele|
    #     if (ele.length > 1) && palindrome?(ele)
    #         array << ele
    #     end
    # end
    # array
    substrings(string).select {|subs| palindrome?(subs) && subs.length > 1}
end

