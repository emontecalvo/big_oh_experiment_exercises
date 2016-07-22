
def find_small_1(arr)
  smallest = false

  until smallest
    idx = 0
    while idx < arr.length
      idx2 = 0
      while idx2 < arr.length
        if arr[idx] > arr[idx2]
          smallest = false
        end
        idx2 += 1
      end
      return arr[idx] if smallest
      idx += 1
      smallest = true
    end
    p idx
  end
end
# time complexity:  n^2




def find_small_2(arr)
  smallest_num = arr[0]

  arr.each do |num|
    smallest_num = num if num < smallest_num
  end
  smallest_num
end
#time complexity = n





def largest_contiguous_subsum(list)
  start_idx = 0
  largest_sum = nil
  largest_sub = nil
  while start_idx < list.length
    length_idx = 0
    while length_idx + start_idx < list.length
      sub_array = list[start_idx..(start_idx+length_idx)]
      sub_totel = sub_array.inject(:+)
      if largest_sum == nil || sub_totel > largest_sum
        largest_sum = sub_totel
        largest_sub = sub_array
      end
      length_idx += 1
    end
    start_idx += 1
  end
  largest_sub
end

# time complexity:  n^2

def largest_contiguous_subsum2(list)
  current_sum = 0
  largest_sum = 0
  list.each do |num|
    if current_sum + num>= 0
      current_sum += num
    else
      current_sum = 0
    end
    if current_sum > largest_sum
      largest_sum = current_sum
    end
  end
  largest_sum
end
