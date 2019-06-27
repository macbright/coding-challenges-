def graph(hash_graph)
  # write your code here
  visited = []
  x = 0
  visited << hash_graph.keys.first
  for i in (0..hash_graph.length-1)
    if hash_graph[x][0] != 4
      visited << hash_graph[x][0]
      i = hash_graph[x][0]
    elsif hash_graph[x][0] == 4
      visited << hash_graph[x][0]
      break
    end
    x = i
  end
  visited
end

hash = { 
  0 => [2], 
  1 => [4], 
  2 => [5, 0, 3], 
  3 => [2], 
  4 => [1, 5], 
  5 => [4, 2]
}

p graph(hash)
# => [0, 2, 5, 4]
