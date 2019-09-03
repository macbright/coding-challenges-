def merge(left, right)
  result = []
  until left.empty? || right.empty? do
    result << (left.first.split(" ")[0].to_i <= right.first.split(" ")[0].to_i ? left.shift : right.shift)
  end
  result + left + right
end

def full_merge_sort1(array)
  # write your code here
  if array.length <= 1 
    return array
  else 
    mid = (array.length / 2 ).floor
    left = full_merge_sort1(array[0..mid-1])
    right = full_merge_sort1(array[mid..array.length])
    merge(left, right)
  end 
end

def full_merge_sort(array)
  arr = full_merge_sort1(array).map {|val| val.split(" ")[1]}
end
full_merge_sort(["0 ab", "6 cd", "0 ef", "6 gh", "4 ij", "0 ab", "6 cd", "0 ef", "6 gh", "0 ij", "4 that", "3 be", "0 to", "1 be", "5 question", "1 or", "2 not", "4 is", "2 to", "4 the"])
# => ["ab", "ef", "ab", "ef", "ij", "to", "be", "or", "not", "to", "be", "ij", "that", "is", "the", "question", "cd", "gh", "cd", "gh"]
