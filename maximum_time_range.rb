
def event_pairs(array)
   n = array.length
   all_events = []
  while n > 0 do 
    event = []
    event << array.shift << array.shift
    all_events << event
    n -= 2
  end
  all_events
  sorted = all_events.sort_by! { |x| x[0]}
end
def maximum_time_range(array)
  # write your code here
  sorted = event_pairs(array)
  check_in_date = sorted[0][0]
  check_out_date = sorted[0][1]
  max_time = []
  arr = []
  for i in (0...sorted.length)
    if sorted[i][1] == check_out_date && sorted[i][1] < sorted[i+1][0] 
      max_time << sorted[i]
      check_out_date = sorted[i+1][1]
      next
    end
    if check_out_date > sorted[i][0]
      arr << sorted[i]
      if check_out_date < sorted[i][1]
        check_out_date = sorted[i][1]
      end
    elsif check_out_date < sorted[i][0]
      max_time << sorted[i]
    end
  end
  # arr << check_in_date << check_out_date
  start_event = arr.min[0]
  end_event = arr.max[1]
  arr1 = []
  arr1 << start_event << end_event
  if max_time.length == 0
    max_time << start_event << end_event
  else 
    max_time << arr1
  end
  print sorted
  max_time.sort
  
end

p maximum_time_range([5, 14, 1, 4, 13, 19, 3, 6, 9, 18])
# => [[4, 8], [10, 18]]