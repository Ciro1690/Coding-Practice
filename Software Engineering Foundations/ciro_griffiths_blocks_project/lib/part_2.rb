def all_words_capitalized?(words)
    words.all?{|word| word[0] == word[0].upcase && word[1..-1] == word[1..-1].downcase}
end

def no_valid_url?(urls)
    ending = ['.com', '.net', '.io', '.org']
    urls.none? do |url|
        ending.any?{|ending| url.end_with?(ending)}
    end
end

def any_passing_students?(students)
    students.any? do |student| 
       student[:grades].sum/student[:grades].length > 75
    end
end
