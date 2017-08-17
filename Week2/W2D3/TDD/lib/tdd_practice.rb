##remove dups

def my_uniq(array)
  new_array = []
  array.each { |el| new_array << el unless new_array.include?(el)}
  new_array
end

class Array
  def two_sum
    result = []
    (0...length-1).each do |idx1|
      (idx1+1...length).each do |idx2|
        if self[idx1]+self[idx2] == 0
          result << [idx1, idx2]
        end
      end
    end
    result
  end
end

def my_transpose(array)
  new_array = Array.new(array[0].length){Array.new(array.length)}
  (0...array.length).each do |row|
    (0...array[0].length).each do |col|
      new_array[col][row] = array[row][col]
    end
  end
  new_array
end

def stock_picker(array)
  max_diff = 0
  days = []
  (0...array.length-1).each do |idx|
    (idx+1...array.length).each do |idx2|
      if (array[idx2] - array[idx]) > max_diff
        days += [idx, idx2]
        max_diff = array[idx2] - array[idx]
      end
    end
  end
  days
end
