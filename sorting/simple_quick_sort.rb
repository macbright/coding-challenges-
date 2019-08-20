def simple_quicksort(array)
  # write your code here
  if array.length <= 1
    return array
  else 
    pivot = array[0]
    array.delete_at(array.index(pivot))
    less = []
    greater = []
  end
  array.each do |x|
    if x <= pivot
      less << x
    else
      greater << x
    end
  end
  sorted_array = simple_quicksort(less) + [pivot] + simple_quicksort(greater)
  puts sorted_array.join(" ")
  sorted_array
end



p simple_quicksort([5, 8, 1, 3, 7, 10, 2])
# => 2 3
#    1 2 3
#    7 8 10
#    1 2 3 5 7 8 10