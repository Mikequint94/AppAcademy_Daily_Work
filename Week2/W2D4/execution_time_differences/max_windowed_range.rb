def max_windowed_range(array, w)
  current_max_range = nil
  (0..array.length-w).each do |idx|
    window = array[idx...idx+w]
    current_range = window.max-window.min
    if current_max_range
      current_max_range = current_range if current_range > current_max_range
    else
      current_max_range = current_range
    end
  end
  current_max_range
end

# p max_windowed_range([1, 3, 2, 5, 4, 8], 5)
# p max_windowed_range([1, 0, 2, 5, 4, 8], 4)

class MyQueue
  def initialize
    @store = []
  end
  def enqueue(el)
    @store.push(el)
  end
  def dequeue
    @store.shift
  end
  def peek
    @store[0]
  end
  def size
    @store.length
  end
  def empty?
    @store.empty?
  end
end

class MyStack
  def initialize
    @store = []
  end
  def push(el)
    @store.push(el)
  end
  def pop
    @store.pop
  end
  def peek
    @store[-1]
  end
  def size
    @store.length
  end
  def empty?
    @store.empty?
  end
end

class StackQueue
  def initialize
    @store1 = MyStack.new
    @store2 = MyStack.new
  end
  def enqueue(el)
    @store2.size.times do
      @store1.push(@store2.pop)
    end
    @store1.push(el)
  end
  def dequeue
    @store1.size.times do
      @store2.push(@store1.pop)
    end
    @store2.pop
  end
  def peek
    @store1.size.times do
      @store2.push(@store1.pop)
    end
    @store2.peek
  end
  def size
    @store1.size + @store2.size
  end
  def empty?
    @store1.empty? && @store2.empty?
  end
end
