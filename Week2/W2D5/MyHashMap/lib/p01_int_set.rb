class MaxIntSet
  def initialize(max)
    @store = Array.new(max) {false}
    @max = max
  end

  def insert(num)
    @store[num] = true if is_valid?(num)
  end

  def remove(num)
    @store[num] = false if is_valid?(num)
  end

  def include?(num)
    return true if @store[num]
    return false
  end

  private

  def is_valid?(num)
    if num > @max || num < 0
      raise "Out of bounds"
    else
      return true
    end
  end

  def validate!(num)
    return true if (0...@max).include?(num)
    return false
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[num % num_buckets] << num unless include?(num)
  end

  def remove(num)
    @store[num % num_buckets].delete(num) if include?(num)
  end

  def include?(num)
    return true if @store[num % num_buckets].include?(num)
    return false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`

  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if @count < num_buckets && include?(num) == false
      self[num] << num
      @count += 1
    elsif include?(num) == false
      resize!
      insert(num)

    end
  end

  def remove(num)
    if include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    num
    return true if self[num].include?(num)
    return false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`

    @store[num % num_buckets]

  end

  def num_buckets
    @store.length
  end

  def resize!
    old_array = @store
    @store = Array.new(num_buckets * 2){ Array.new }
    old_array.each do |el|
      el.each do |x|
          insert(x)
          @count -= 1
      end
    end
  end


  #   num_buckets.times{ @store << [] }
  #     @store.each_index do |idx|
  #       #next if @store[idx].empty?
  #
  #       if @store[idx].length == 1
  #         el = @store[idx][0]
  #         remove(el)
  #         insert(el)
  #       end
  #     end
  # end
end
