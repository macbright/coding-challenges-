def index_match(array)
  # write your code here
  index = 0
  result = -1
  for i in (0...array.length) do
    if array[i] == i 
      result = i
    end
  end
  result
end

# puts index_match([0, 2, 3, 7, 9, 11])
puts index_match([-25, -20, -15, -10, -5, 5, 7, 8, 9, 10, 11, 12])
# => 0