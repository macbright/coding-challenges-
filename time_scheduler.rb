def time_scheduler(array)
  # write your code here
  n = array.length
  all_events = []
  while n > 0 do 
    event = []
    event << array.shift << array.shift
    all_events << event
    n -= 2
  end
  sorted = all_events.sort_by! { |x| x[1]}
  result =  [sorted[0]]
  for i in (0..sorted.length-1)
    if sorted[i][0] > result.last.last 
      result << sorted[i] 
    end
  end
  print sorted
  result
  
  
end

p time_scheduler([4, 8, 1, 3, 7, 9, 5, 6])
# => [[1,3], [5,6], [7,9]]