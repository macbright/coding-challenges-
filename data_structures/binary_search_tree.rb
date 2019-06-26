class Node
  attr_reader :data
  attr_accessor :left, :right

  def initialize(data)
    @data = data
  end
end
def pre_order(node)
  if node == nil
    return ''
  end
  result = "#{node.data} "
  result += pre_order(node.left)
  result += pre_order(node.right)

end
def insert(node, data)
  if(data > node.data)
    if(node.right)
      insert(node.right, data)
    else
      node.right = Node.new(data)
    end
  else
    if(node.left)
      insert(node.left, data)
    else
      node.left = Node.new(data)
    end
  end
end
def binary_search_tree(array)
  root = Node.new(array.shift)
  array.each{|e| insert(root, e) }
  result = pre_order(root)
  result.strip
end

puts binary_search_tree([8, 3, 10, 1, 6, 14, 4, 7, 13])
# => "8 3 1 6 4 7 10 14 13"
