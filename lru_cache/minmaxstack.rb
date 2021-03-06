require_relative "my_stack"

class MinMaxStack
  def initialize
    @store = MyStack.new
  end

  def empty?
    @store.empty?
  end

  def min
    @store.peek[:min] unless empty?
  end

  def max
    @store.peek[:max] unless empty?
  end

  def peek
    @store.peek[:value] unless empty?
  end

  def pop
    @store.pop[:value] unless empty?
  end

  def push(val)
    # By using a little extra memory, we can get the max simply by peeking,
    # which is O(1).
    @store.push({
      max: new_max(val),
      min: new_min(val),
      value: val
    })
  end

  def size
    @store.size
  end

  private

  def new_max(val)
    empty? ? val : [max, val].max
  end

  def new_min(val)
    empty? ? val : [min, val].min
  end
end

m = MinMaxStack.new

m.push(1)
m.push(2)
m.push(3)

p m
p "first max: #{m.max}, min: #{m.min}"
m.pop
p m
p "second max: #{m.max}, min: #{m.min}"
