def first_anagram?(string1, string2)
  perms1 = string1.chars.permutation(string1.length).to_a
  perms_strings = perms1.map do |el|
    el.join
  end
  perms_strings.include?(string2)
end

# O(n!)

# p first_anagram?("and", "dan")
# p first_anagram?("rachel", "ghdsjy")

def second_anagram?(string1, string2)
  letters_in_one = string1.chars
  letters_in_two = string2.chars
  string1.chars.each_with_index do |letter, i|
    if letters_in_two.include?(letter)
      first_idx = letters_in_one.find_index(letter)
      second_idx = letters_in_two.find_index(letter)
      letters_in_two.delete_at(second_idx)
      letters_in_one.delete_at(first_idx)
    end
  end
  return true if letters_in_one.empty? && letters_in_two.empty?
  false
end

# O(n^2)

# p second_anagram?("and", "dan")
# p second_anagram?("rachel", "ghdsjy")

def third_anagram?(string1, string2)
  string1.chars.sort == string2.chars.sort
end

# O(nlog(n))

# p third_anagram?("and", "dan")
# p third_anagram?("rachel", "ghdsjy")

def fourth_anagram?(string1, string2)
  counter1 = Hash.new(0)
  counter2 = Hash.new(0)
  string1.chars.each { |letter| counter1[letter]+=1 }
  string2.chars.each { |letter| counter2[letter]+=1 }
  counter1 == counter2
end

# O(1)

# p fourth_anagram?("and", "dan")
# p fourth_anagram?("rachel", "ghdsjy")

def fifth_anagram?(string1, string2)
  counter = Hash.new(0)
  string1.chars.each { |letter| counter[letter] += 1 }
  string2.chars.each { |letter| counter[letter] -= 1 }
  counter.values.all? { |el| el ==0 }
end

# O(1)

p fifth_anagram?("and", "dan")
p fifth_anagram?("rachel", "ghdsjy")
