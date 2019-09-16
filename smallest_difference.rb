def smallest_difference(array)
  # write your code here
   sorted = array
   dif = (sorted[0] - sorted[1]).abs
  puts dif
   new_arr = []
   for i in (0...sorted.length) do 
     for j in (0...sorted.length) do 
       if (sorted[i] - sorted[j]).abs < dif && sorted[i] != sorted[j]
         new_arr[0] = [sorted[i], sorted[j]].min
         new_arr[1] = [sorted[j], sorted[i]].max
         dif = (new_arr[0] - new_arr[1]).abs
        # puts dif
      # else 
      #   new_arr[0] = sorted[0]
      #   new_arr[1] = sorted[1]
       end
     end
   end
   print sorted
   puts ""
  puts dif
  puts new_arr[0] - new_arr[1]
  new_arr
  
  
end

p smallest_difference([-20, -3916237, -357920, -3620601, 7374819, -7330761, 30, 6246457, -6461594, 266854])
# => [-20, 30]