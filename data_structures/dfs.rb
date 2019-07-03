def create_dfs(graph, node, result, visited)
   result << node 
  visited[node] = true
  for i in graph[node]
    create_dfs(graph, i, result, visited) unless visited[i]
  end
  return result
end

def depth_first_search(graph)
  visited = Array.new(graph.length, false)
  create_dfs(graph, 0, [], visited)
end
# def depth_first_search(graph)
  # write your code here
  # graph1 = graph
  # visited = []
  # x = 0
  # visited << graph1.keys.first
  # for i in (0..graph1.length-1)
  #   graph1[x].each do |y|
  #     i = 0
  #     if visited.include?(y) 
  #       graph1[x].delete_at(0)
  #     else
  #       visited << y
  #       graph1[x].delete_at(0)
  #       x = y
        
  #     end
  #     i +=1
  #   end
  # end
  
  # visited
# end

p depth_first_search({
  0 => [2], 
  1 => [4], 
  2 => [5, 0, 3], 
  3 => [2], 
  4 => [1, 5], 
  5 => [4, 2]

})
# => [0, 2, 5, 4, 1, 3]