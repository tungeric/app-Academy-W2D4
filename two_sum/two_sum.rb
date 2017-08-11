def bad_two_sum?(arr, target)
  i = 0
  while i < arr.length - 1
    j = i + 1
    while j < arr.length
      if arr[i]+arr[j] == target
        return true
      end
      j+=1
    end
    i+=1
  end
  false
end

# O(n^2)
# p bad_two_sum?([1,2,3],4)
# p bad_two_sum?([1,2,3],14)

def okay_two_sum?(arr, target)
  duped = arr.sort
  i = 0
  j = duped.length - 1
  while i != j
    temp_sum = duped[i] + duped[j]
    case temp_sum <=> target
    when -1
      i += 1
    when 0
      return true
    when 1
      j -= 1
    end
  end
  false
end

#O(n log n)
# arr = [0, 1, 5, 7]
# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false

def hash_two_sum?(arr, target)
  hash = Hash.new
  arr.each do |el|
    dragons = target - el
    if hash.keys.include?(dragons)
      return true
    else
      hash[el] = dragons
    end
  end
  false
end

arr = [0, 1, 5, 7]
p hash_two_sum?(arr, 6) # => should be true
p hash_two_sum?(arr, 10) # => should be false
p hash_two_sum?([1,2,3],4)
p hash_two_sum?([1,2,3],14)
