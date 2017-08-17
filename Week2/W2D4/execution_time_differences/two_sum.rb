def bad_two_sum?(arr, target_sum) # SLEDGE HAMMER # THOR #
  (0...arr.length-1).each do |m|
    (m...arr.length).each do |s|
      return true if arr[m] + arr[s] == target_sum
    end
  end
  false
end
#  0(n^2)


def okay_two_sum?(arr, target_sum)
  arr = arr.sort
  arr.each do |el|
    seeking = target_sum - el
    return true if arr.bsearch { |x| x == seeking }
  end
  false
end

# p okay_two_sum?([3,4,6,7,8,4,3,6,7],12)

def two_sum?(arr, target_sum)
  result = {}
  arr.each_with_index do |el, idx|
    return true if result[el]
    result[target_sum-el] = idx
  end
  false
end
p two_sum?([3,4,6,7,8,4,3,6,7],12)
