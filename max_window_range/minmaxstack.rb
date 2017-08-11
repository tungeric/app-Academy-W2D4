class MinMaxStack
  def initialize
    @store = []
  end

  def push(el)
    hash = Hash.new
    hash[:val] = el
    prev_hash = Hash.new
    prev_hash = peek unless empty?
    if prev_hash.empty?
      hash[:min] = el
      hash[:max] = el
    else
      prev_hash[:min] > el ? hash[:min] = el : hash[:min] = prev_hash[:min]
      prev_hash[:max] < el ? hash[:max] = el : hash[:max] = prev_hash[:max]
    end
    @store << hash
    hash
  end

  def max
    peek[:max]
  end

  def min
    peek[:min]
  end

  def pop
    @store.pop
  end

  def peek
    @store.last
  end

  def size
    @store.count
  end

  def empty?
    @store.empty?
  end

end
