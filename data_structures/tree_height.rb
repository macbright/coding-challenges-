def binary_tree_height(array_tree)
  # write your code here
  count = 0 
  left = [] #left node
  root_node = 1 
  i = 0 
  until array_tree[2*i+1] == nil
    count +=1 
    left << array_tree[2*i+1]
    i = 2*i +1 
  end 
  count + root_node
end

puts binary_tree_height([2, 7, 5, 2, 6, 0, 9])
# => 3