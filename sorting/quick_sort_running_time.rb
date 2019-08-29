def running_time(array)
  # write your code here
  shifts = 0 
  for i in (0...array.length) do 
      if array[i] > array[i-1]
        next
      else 
        for j in (0..i) do 
          if array[i] < array[j] 
            shifts += i-j
            array.insert(j, array[i])
            array.delete_at(i+1)
            # puts array.join(' ')
          end
        end
      end
  end 
  shifts
end

def partition(array, s, e, shifts)
  pivot_index = s
  i = s
  while i < e 
    if array[i] <= array[e]
      array[i], array[pivot_index] = array[pivot_index], array[i]
      pivot_index += 1
      shifts << 1
    end
    i += 1
  end
  array[pivot_index], array[e] = array[e], array[pivot_index]
  shifts << 1
  puts array.join(' ')
  pivot_index 
end

def advanced_quicksort(array, s, e, shifts)
  if s < e 
    pivot_index = partition(array, s, e, shifts)
    advanced_quicksort(array, s, pivot_index-1, shifts)
    advanced_quicksort(array, pivot_index+1, e, shifts)
  end
end
def quicksort_running_time(array)
  # write your code here
  shifts = []
  arr1 = array.map{|x| x}
  advanced_quicksort(array, 0, array.length-1, shifts)
  running_time(arr1) - shifts.length
end

puts quicksort_running_time([1, 3, 9, 8, 2, 7, 5])
# => 1
