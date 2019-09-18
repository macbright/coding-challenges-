def duplicates(arr1, arr2)
  # write your code here
  h = Hash.new
  arr2.each{|x| h[x] = 0 }
  arr2.each{|x| h[x] += 1 }
  arr1.each{|x| h[x] += 1 }
  arr = []
  h.each{|x, y| arr << x if y % 2 != 0}
  arr.sort
end

p duplicates([203, 204, 205, 206, 207, 208, 203, 204, 205, 206], [203, 204, 204, 205, 206, 207, 205, 208, 203, 206, 204, 205, 206])
# => [204, 205, 206]