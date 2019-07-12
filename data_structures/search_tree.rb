class Node
  attr_accessor :left, :right, :data 
  
  def initialize(data)
    @data = data 
    @left = nil 
    @right = nil 
  end 
end 
def array_to_tree(array, i)
  return nil if i >= array.length

  node = Node.new(array[i])
  node.left = array_to_tree(array, 2*i+1)
  node.right = array_to_tree(array, 2*i+2)

  node
end

def ibstutility(root, min_value, max_value)
  if root == nil || root.data == 0
    return true 
  end 
  if (root.data <= max_value) && 
    (root.data >= min_value) && 
    (ibstutility(root.left, min_value, root.data)) && 
    (ibstutility(root.right, root.data, max_value))
    return true 
  end
  return false
end 
def search_tree?(tree)
  root = array_to_tree(tree, 0)
  min_value = -1/0.0
  max_value = 1/0.0 
  ibstutility(root, min_value, max_value)
end

puts search_tree?([21, 11, 26, 5, 14, 23, 30, 2, 8, 13, 16, 0, 0, 0, 0])
# puts search_tree?([10, 4, 12])
# # # => true
# puts search_tree?([10, 5, 7])
# # # => false