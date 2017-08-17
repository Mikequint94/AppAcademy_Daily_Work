class Array
  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end
  end
  def my_select(&prc)
    new_array = []
    self.my_each do |num|
      new_array << num if prc.call(num)
    end
    new_array
  end
  def my_reject(&prc)
    new_array = []
    self.my_each do |num|
      new_array << num unless prc.call(num)
    end
    new_array
  end
  def my_any?(&prc)
    self.my_each do |num|
      return true if prc.call(num)
    end
    false
  end
  def my_all?(&prc)
    self.my_each do |num|
      return false unless prc.call(num)
    end
    true
  end
  def my_flatten
    @result = []
    self.each do |num|
      @result << num unless nested_array?(num)
      flatten2(num) if nested_array?(num)
    end
    @result
  end
  def nested_array?(array)
    array.is_a?(Array)
  end
  def flatten2(num)
    num.each do |n|
      @result << n unless nested_array?(n)
      flatten2(n) if nested_array?(n)
    end
  end
  def my_zip(*arrays)
    new_array = []
    max_length = self.length
    i = 0
    while i < max_length
      new_array[i] = [self[i]]
      arrays.each do |array|
        new_array[i] << array[i]
      end
      i += 1
    end
    new_array
  end
  def my_rotate(shift=1)

    shift = shift % self.length
    self[shift..-1] + self[0...shift]
  end
  def my_join(str="")
    result = ""
    self.each do |ch|
      result << ch + str
    end
    str_length = str.length + 1
    result[0..-str_length]
  end

  def my_reverse
    result = []
    self.each do |el|
      result.unshift(el)
    end
    result
  end
end
