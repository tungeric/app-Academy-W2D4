require 'minmaxstackqueue.rb'

def windowed_max_range(array, window_size)
  i = 0
  max_range = 0
  while i + window_size - 1 < array.length
    p partial_array = array[i..i + window_size - 1].sort
    partial_max = partial_array.last - partial_array.first
    max_range = partial_max if partial_max > max_range
    i += 1
  end
  max_range
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8

def optimized_windowed_max_range(array, window_size)
  mmsq = MinMaxStackQueue.new
  return nil if window_size > array.length
  duped = array.dup
  window_size.times do
    mmsq.enqueue(duped.shift)
  end
  i = 0
  until duped.empty?
    mmsq.dequeue
  end
end
