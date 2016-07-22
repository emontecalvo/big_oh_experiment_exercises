require "byebug"

def bad_two_sum?(array, target_sum)
  idx_slow = 0

  while idx_slow < array.length - 1
    idx_fast = idx_slow + 1
    while idx_fast < array.length
      return true if array[idx_slow] + array[idx_fast] == target_sum
      idx_fast += 1
    end
    idx_slow += 1
  end
  false
end

# arr = [0, 1, 5, 7]
# p a = bad_two_sum?(arr, 6) # => should be true
# p b = bad_two_sum?(arr, 10)

# time complexity = n^2

def okay_two_sum?(array, target)
  i = 0
  j = array.length - 1
  while i < j
    case array[i] + array[j] <=> target_sum
    when 0
      return true
    when 1
      j -= 1
    when -1
      i += 1
    end
  end
end
#time complexity n

# HASH MAP
def pair_sum?(array, target)
  hash = {}

  array.each do |num|
    return true if hash.has_key?(target - num)
    hash[num] = nil
  end
  false
end

def pair_sum2?(array, target)
  hash = {}

  array.each do |num|
    return true if hash[target - num] == true
    hash[num] = true
  end
  false
end
# time complexity n

def four_sum?(array, target)
  array.each_with_index do |num, idx|
    idx2 = idx + 1
    while idx2 < array.length
      temp_arr = array.dup
      temp_arr.delete_at(idx)
      temp_arr.delete_at(idx2)
    #  byebug
      temp_target = target - (num + array[idx2])
      return true if pair_sum2?(temp_arr, temp_target)
      idx2 += 1
    end
  end
  false
end



array1 = [1, 2, 3, 4, 5, 6, 8, 9, 10, 11, 20]
p a = four_sum?(array1, 26)
p a = four_sum?(array1, 200)
p b = four_sum?(array1, 41)

# time complexity = n^3
