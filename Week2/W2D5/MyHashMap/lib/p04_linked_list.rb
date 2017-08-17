class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  def initialize
    @list = []
    @head = Node.new
    @tail = Node.new
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
  end

  def last
  end

  def empty?
    @list.length == 0
  end

  def get(key)
    @list.each do |node|
      return node.val if node.key == key
    end
    nil
  end

  def include?(key)
    @list.each do |node|
      return true if node.key == key
    end
    false
  end

  def append(k, v)
    @list << Node.new(k, v)
    @list[-1].prev = @list[-2] || @head
    @list[-1].next = @tail
  end

  def update(key, val)
    p @list
    @list.each do |node|
      node.val = val if node.key == key
    end

  end

  def remove(key)
    @list[key].next.prev = @list[key].prev, @list[key].prev.next = @list[key].next
    @list[key].delete
  end

  def each
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
