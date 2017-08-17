def first_anagram?(string1, string2)
  permutations1 = string1.chars.permutation(string1.length)
  permutations1.each do |perm|
    return true if perm.join == string2
  end

  false
end

# p first_anagram?("justin","injust")
# p first_anagram?("michael jesse quint","samuel")

def second_anagram?(string1, string2)
  string1.chars.each do |el|
    string2.chars.each do |el2|
      if el == el2
        string1.
        string2[idx2] = ""
      end
    end
  end
  return true if string1.empty? && string2.empty?
  false
end
#
p second_anagram?("justin", "injust")
p second_anagram?("michael jesse quint", "samuel")

def third_anagram?(string1, string2)
  string1.chars.sort == string2.chars.sort
end
#
# p third_anagram?("justin", "injust")
# p third_anagram?("michael jesse quint", "samuel")

def fourth_anagram?(string1, string2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)
  string1.chars.each do |ch|
    hash1[ch] = string1.count(ch)
  end
  string2.chars.each do |ch|
    hash2[ch] = string2.count(ch)
  end
  hash1 == hash2
end

# p fourth_anagram?("justin", "injust")
# p fourth_anagram?("michael jesse quint", "samuel")

def fifth_anagram?(string1, string2)
  hash = Hash.new(0)
  string1.chars.each do |ch|
    hash[ch] +=1
  end
  string2.chars.each do |ch|
    hash[ch] -=1
  end
  hash.values.all? {|v| v == 0}
end

# p fifth_anagram?("justin", "injust")
# p fifth_anagram?("michael jesse quint", "samuel")
