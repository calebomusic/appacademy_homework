class Stack
  attr_reader :stack

  def initialize
    @stack = []
  end

  def add(el)
    @stack << el
  end

  def remove
    @stack.pop
  end

  def show
    stack
  end
end

class Queue
  attr_reader :queue

  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue << el
  end

  def dequeue
    @queue.shift
  end

  def show
    queue
  end
end

class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    remove(key) if include?(key)
    @map << [key, value]
  end

  def lookup(key)
    @map.each do |pair|
      if pair[0] == key
        return pair[1]
      end
    end
  end

  def remove(key)
    idx = nil
    @map.each_with_index do |pair, i|
      if pair[0] == key
        @map.delete_at(i)
        break
      end
    end
  end

  def include?(key)
   @map.each do |pair|
     return true if pair[0] == key
   end
   false
  end

  def show
    @map
  end
end
