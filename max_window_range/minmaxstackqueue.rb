require_relative 'minmaxstack.rb'

class MinMaxStackQueue
  def initialize
    @push_stack = MinMaxStack.new
    @pop_stack = MinMaxStack.new
  end

  def min
    push_min = @push_stack.peek[:min] unless @push_stack.empty?
    pop_min = @pop_stack.peek[:min] unless @pop_stack.empty?
    if @push_stack.empty?
      return pop_min
    elsif @pop_stack.empty?
      return push_min
    end
    push_min < pop_min ? push_min : pop_min
  end

  def max
    push_max = @push_stack.peek[:max] unless @push_stack.empty?
    pop_max = @pop_stack.peek[:max] unless @pop_stack.empty?
    if @push_stack.empty?
      return pop_max
    elsif @pop_stack.empty?
      return push_max
    end
    push_max > pop_max ? push_max : pop_max
  end

  def enqueue(el)
    @push_stack.push(el)
  end

  def dequeue
    push_to_pop if @pop_stack.empty?
    element = @pop_stack.pop
  end

  def peek
    push_to_pop if @pop_stack.empty?
    @pop_stack.peek
  end

  def size
    @push_stack.size
  end

  def empty?
    @push_stack.empty?
  end

  def push_to_pop
    until @push_stack.empty?
      @pop_stack.push(@push_stack.pop[:val])
    end
  end

  def pop_to_push
    until @pop_stack.empty?
      @push_stack.push(@pop_stack.pop[:val])
    end
  end
end
