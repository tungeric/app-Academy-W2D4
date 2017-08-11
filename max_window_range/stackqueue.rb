require_relative 'my_stack.rb'

class StackQueue
  def initialize
    @push_stack = MyStack.new
    @pop_stack = MyStack.new
  end

  def enqueue(el)
    @push_stack.push(el)
  end

  def dequeue
    push_to_pop if pop_stack.empty?
    element = @pop_stack.pop
  end

  def peek
    push_to_pop if pop_stack.empty?
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
      @pop_stack.push(@push_stack.pop)
    end
  end

  def pop_to_push
    until @pop_stack.empty?
      @push_stack.push(@pop_stack.pop)
    end
  end
end
