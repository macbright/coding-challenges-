def bfs(graph)
  # write your code here
  visited = []
  y = 0
  index = 0
  visited << graph.keys.first # the first node visited
  graph.length.times do 
    if graph[y] == nil 
      break 
    end
    graph[y].each do |x|
      if x == index || visited.include?(x)
        next
      else 
        visited << x
      end
    end
    graph[y].each do |x|
      if visited.include?(x) && graph[y] != nil 
        y = graph[y].shift
      end
    end
    index = y
    
    
  end
  visited
end

p bfs({
  0 => [2], 
  1 => [4], 
  2 => [5, 0, 3], 
  3 => [2], 
  4 => [1, 5], 
  5 => [4, 2]
})
# => [0, 2, 5, 3, 4, 1]