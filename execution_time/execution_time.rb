
def my_min_1(arr)
  arr.each do |el|
    smallest = true
    arr.each do |compared_el|
      next if el == compared_el
      smallest = false if compared_el < el
    end
    return el if smallest == true
  end
end

def my_min_2(arr)
  min_val = arr.first
  arr.each do |el|
    min_val = el if el < min_val
  end
  min_val
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min_1(list)
# p my_min_2(list)

def largest_contiguous_subsum_1(arr)
  res = []
  i = 0
  while i < arr.length
    j = i
    while j < arr.length
      res << arr[i..j].reduce(:+)
      j += 1
    end
    i += 1
  end
  res.max
end

# p largest_contiguous_subsum_1([2, 3, -6, 7, -6, 7])

def largest_contiguous_subsum_2(arr)
  sum = 0
  max = 0
  arr.each do |num|
    sum += num
    if sum > 0
      max = sum if sum > max
    else
      sum = 0
    end
  end
  max
end

p largest_contiguous_subsum_2([2, 3, -6, 7, -6, 7])
