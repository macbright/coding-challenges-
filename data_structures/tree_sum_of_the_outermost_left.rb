
def leftmost_nodes_sum(array)
  left = []
  left << array[0]
  i = 0 
  until array[2*i+1] == nil
    left << array[2*i+1]
    i = 2*i +1 
  end 
  # print left
  sum = left.inject('+')
end
puts leftmost_nodes_sum([2, 7, 5, 2, 6, 0, 9])
# => 11
puts leftmost_nodes_sum([5, 3, 4, 11, 13, 15, 21, 10, 4, 7, 2, 8, 0, 9, 0])
# => 29