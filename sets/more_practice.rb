
def duplicate(arr)
  array = []
  array << arr[0]
  n =0 
  for i in (0...arr.length) do 
    if !array.include?(arr[i].sort) && !array.include?(arr[i].sort.reverse)
      array << arr[i]
    end
  end
  array
end
def find_pairs(array, k)
  # write your code here
  list = []
  pairs = []
  for i in (0...array.length) do 
    for j in (0...array.length) do 
      if array[i] + array[j] == k 
        pairs << array[i] 
        pairs << array[j]
        list << pairs
      end
    end
    pairs = []
  end
  duplicate(list)
  
end

p find_pairs([1, 9, 11, 13, 2, 3, 7], 12)
# => [[1, 11], [9, 3]]