class LRUCache
def initialize(size)
  @cache = Array.new(size)
  @size = size
end

def count
  @cache.size
end

def add(el)
  if @cache.include?(el)
    @cache.delete(el)
    @cache.push(el)
  elsif count >= @size
    @cache.shift
    @cache.push(el)
  else
    @cache.push(el)
  end
end

def show
  puts @cache
end

private
# helper methods go here!

end
