# recursive
def range(start, finish)
  return [] if finish <= start
  [start] + range(start + 1, finish)
end

# p range(1,5)

#iterative
def range_iterative(start, finish)
  result = [ ]
  (start...finish).each { |ele| result << ele }
  result
end

# p range_iterative(3,7)

#exponentation - recursion 1
def exp1(num, exponent)
  return 1 if exponent == 0
  # return ( 1 / exp1(num, exponent - 1) )

  num * exp1(num, exponent - 1)
end

# p exp1(2, 0)
# p exp1(2, 3)

#exponentation - recursion 2
def exp2(num, exponent)
  return 1 if exponent == 0
  exp_recursion = exp2(num, (exponent / 2))
  if exponent.even?
    exp2(num, (exponent / 2)) * exp2(num, (exponent / 2))
  else
    num * exp2(num, (exponent - 1) / 2) * exp2(num, (exponent - 1) / 2)
  end


end

# p exp2(2, 4)
# p exp2(2, 7)

#deep dup
class Array

  def deep_dup
    deep_array = Array.new(self.length) { [ ] }
    self.each.with_index do |ele, idx|
      deep_array[idx] << ele
    end
    deep_array
  end

end

# original = ["1", "2", "3"]
# copy = original.deep_dup
# copy[1] << "LED"
# puts copy
# puts original

#fibionacci - iteration
def fib_it(n)
  fib_array = [1, 1]
  return fib_array if n == 2
  return [1] if n == 1

  (3..n).count { fib_array << fib_array[-2] + fib_array[-1] }

  fib_array
end

# p fib_it(5)

#fibionacci - recursion
def fib_rec(n)
  return nil if n < 1
  return [1] if n == 1
  return [1, 1] if n == 2
  current = [1, 1]
  recursive = fib_rec(n - 1)
  (recursive.length - 1).times do |el|
    current << recursive[el] + recursive[el + 1]
  end
  current
end

# p fib_rec(8)

# def subsets_practice(array)
#   subset_arr=[[], array]
#   array.each_index do |idx|
#     next_idx = idx+1
#     subset_arr << [array[idx]]
#     subset_arr << [array[idx], array[next_idx] || array[0]]
#   end
#   p subset_arr
# end

def subsets(array)
  return [[]] if array.empty?
  subs = array[0...-1]
  smaller_subs = subsets(subs)
  bigger_subs = []
  smaller_subs.each do |sub|
    bigger_subs << sub + [array[-1]]
  end
  smaller_subs + bigger_subs
end


# subsets([1, 2, 3, 4, 5])

#permutations - from solutions, but re-work later
def permutations(array)
  return [array] if array.length <= 1

  first = array.shift
  perms = permutations(array)

  total_permutations = []

  perms.each do |perm|
    (0..perm.length).each do |i|
      total_permutations << perm[0...i] + [first] + perm[i..-1]
    end
  end

  total_permutations
end

#p permutations([1, 2, 3])

def bsearch(array, target)

  return nil unless array.include?(target)

  middle = (array.length - 1) / 2
  return middle if target == array[middle]

  if target < array[middle]
    bsearch(array[0...middle], target)
  elsif target > array[middle]
    middle + 1 + bsearch(array[(middle + 1)..-1], target)
  end
end

# puts bsearch([1, 2, 3], 1) # => 0
# puts bsearch([2, 3, 4, 5], 3) # => 1
# puts bsearch([2, 4, 6, 8, 10], 6) # => 2
# puts bsearch([1, 3, 4, 5, 9], 5) # => 3
# puts bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# puts bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# puts bsearch([1, 2, 3, 4, 5, 7], 6) # => nil


#merge_sort
class Array

  def merge(left, right)
    merged = []
    until left.empty? || right.empty?
      if left[0] < right[0]
        merged << left.shift
      else
        merged << right.shift
      end
    end
    merged + left + right
  end

  def merge_sort
    return self if self.length < 2
    return nil if self.empty?
    middle = (self.length - 1) / 2

    left = self[0..middle]
    right = self[(middle + 1)..-1]

    merge(left.merge_sort, right.merge_sort)

  end

end

p [5, 0, 1, 3, 8, 10].merge_sort
