def partition(array, s, e)
  pivot_index = s
  i = s
  while i < e 
    if array[i] <= array[e]
      array[i], array[pivot_index] = array[pivot_index], array[i]
      pivot_index += 1
    end
    i += 1
  end
  array[pivot_index], array[e] = array[e], array[pivot_index]
  puts array.join(' ')
  pivot_index
end

def advanced_quicksort(array, s=0, e = array.length-1)
  if s < e 
    pivot_index = partition(array, s, e)
    advanced_quicksort(array, s, pivot_index-1)
    advanced_quicksort(array, pivot_index+1, e)
  end
end

advanced_quicksort([1, 3, 9, 8, 2, 7, 5])
# => 1 3 2 5 9 7 8
#    1 2 3 5 9 7 8
#    1 2 3 5 7 8 9
