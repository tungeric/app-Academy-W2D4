class MyStack
  attr_reader :max, :min
  def initialize
    @store = []
  end

  def push(el)
    @store << el
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
