def running_time(array)
  # write your code here
  shifts = 0 
  for i in (0...array.length) do 
      if array[i] > array[i-1]
        # next
        puts array.join(' ')
        # shifts +=1 
      else 
        for j in (0..i) do 
          if array[i] < array[j] 
            shifts += i-j
            array.insert(j, array[i])
            array.delete_at(i+1)
            # puts array.join(' ')
          end
        end
      end
  end 
  shifts
end

# puts running_time([2, 1, 3, 1, 2])
puts running_time([10, 9, 8, 7, 6, 5, 4, 3, 2, 1])
# => 4