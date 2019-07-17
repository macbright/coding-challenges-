def circle_util(graph, node, visited, parent)
  visited[node] = true
  return false unless graph[node]
  for i in graph[node]
    if !visited[i]
      return true if circle_util(graph, i,  visited, node)
    elsif parent != i
      return true 
    end
  end
  return false
end
def graph_cycle?(graph)
  # write your code here
  visited = Array.new(graph.length, false)
  circle_util(graph, 0, visited, -1)
end

puts graph_cycle?({
  0=>[2], 
  1=>[4], 
  2=>[0, 5, 3], 
  3=>[5, 2], 
  4=>[5, 1], 
  5=>[4, 2, 3]
})
# => true

puts graph_cycle?({
  0=>[2], 
  1=>[2], 
  2=>[0, 1, 3, 4, 5], 
  3=>[2], 
  4=>[2]
})
# => false