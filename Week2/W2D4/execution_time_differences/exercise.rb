
# PHASE 1
def my_min_1(list)
  smallest = list.first
  list.each do |el|
    smallest = el if el < smallest
    list.each do |el2|
      smallest = el2 if el2 < smallest
    end
  end
  smallest
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
#p my_min_1(list)

# PHASE 2
def my_min(list)
  smallest = list.first
  list.each do |el|
    smallest = el if el < smallest
  end
  smallest
end
#p my_min(list)

# Phase1
def largest_contiguous_subsum_1(list)
  subsums = []
  (0...list.length).each do |idx|
    (idx...list.length).each do |idx2|
      subsums << list[idx..idx2].reduce(:+)
    end
  end
subsums.max
end
list = [2, 3, -6, 7, -6, 7]
#p largest_contiguous_subsum(list) # => 8

#phase2 Thicc
def largest_contiguous_subsum_2(list)
  current_sum = 0
  largest_sum = 0
  (0...list.length).each do |idx|
    current_sum += list[idx]
    largest_sum = current_sum if current_sum > largest_sum
    current_sum = 0 if current_sum < 0
  end
  largest_sum
end

p largest_contiguous_subsum_2(list)
