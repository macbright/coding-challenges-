def partition(array)
  # write your code here
  arr = []
  arr << array[0]
  for i in (1...array.length) do 
    if array[i] < array[0]
      arr.insert(arr.index(array[0]), array[i])
    else 
      arr << array[i]
    end 
    
  end
  arr
end

p partition([4, 5, 3, 9, 1])
# => [3, 1, 4, 5, 9]