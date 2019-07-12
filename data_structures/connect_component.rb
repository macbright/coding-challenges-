def create_dfs(graph, node, result, visited)
   result << node 
  visited[node] = true
  for i in graph[node]
    create_dfs(graph, i, result, visited) unless visited[i]
  end
  return result.sort
end
def connected_graph?(graph)
  visited = Array.new(graph.length, false)
  result = create_dfs(graph, 0, [], visited) 
  
  graph_keys = graph.keys
  
  if result == graph_keys
    return true
  else 
    return false 
  end 
end

puts connected_graph?({
  0 => [2], 
  1 => [4], 
  2 => [0, 5, 3], 
  3 => [5, 2], 
  4 => [5, 1], 
  5 => [4, 2, 3]
})
# => true

puts connected_graph?({
  0 => [1, 2], 
  1 => [0, 2], 
  2 => [0, 1, 3, 4, 5], 
  3 => [2, 4], 
  4 => [3, 2], 
  5 => [2]
})
# => true