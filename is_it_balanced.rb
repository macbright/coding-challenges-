
def height(array_tree, i)
  return 0 if array_tree[i].nil? or array_tree[i] == 0
  height_left = height(array_tree, 2*i + 1)
  height_right = height(array_tree, 2*i + 2)
  total_height = 1 + [height_left, height_right].max
end
def balanced_tree?(array_tree, index=0)
  return true if array_tree[index] == nil || array_tree[index] == 0
  left_height = height(array_tree, 2*index+1)
  right_height = height(array_tree, 2*index+2)
  puts left_height, right_height
  if (left_height - right_height).abs <= 1 &&
     balanced_tree?(array_tree, 2*index+1) &&
     balanced_tree?(array_tree, 2*index+2)
    return true
  end
  false

end

puts balanced_tree?([1, 2, 0, 3, 4, 0, 0])
# => false

puts balanced_tree?([1, 2, 3, 4, 5, 6, 7])
# => true