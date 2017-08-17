def factors(num)
  results = []
  (1..num).each do |n|
    results <<  n if num % n == 0
  end
  results
end
class Array
  def bubble_sort!(&prc)
    prc ||= Proc.new{|num1,num2| num1 <=> num2}

    sorted = false
    until sorted
      sorted = true
      self.each_index do |idx|
        if idx != self.length-1
          if prc.call(self[idx],self[idx+1]) == 1
            self[idx], self[idx+1] = self[idx+1], self[idx]
            sorted = false
          end
        end
      end
    end
    self
  end

  def bubble_sort(&prc)
    prc ||= Proc.new{|num1,num2| num1 <=> num2}
    self.dup.bubble_sort!(&prc)
  end

end

def substrings(string)
  result = []
  for i in 0..string.length - 1
    for j in i..string.length - 1
      result << string[i..j]
    end
  end
  result.uniq
end

def subwords(word,dictionary)
  result = []
  substrings(word).each do |str|
    result << str if dictionary.include?(str)
  end
  result
end
