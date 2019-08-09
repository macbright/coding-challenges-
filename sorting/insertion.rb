def sort_itself(array)
  # write your code here
  arr = array.sort 
  
  for i in (1...array.length) do 
      if array[i] > array[i-1]
        puts array.join(' ')
      else 
        for j in (0..i) do 
          if array[i] < array[j] 
            array.insert(j, array[i])
            array.delete_at(i+1)
            break
          end
        end
        puts array.join(' ')
      end
  end 
end

sort_itself([1, 4, 3, 6, 9, 2])
# => 1 4 3 6 9 2
#    1 3 4 6 9 2
#    1 3 4 6 9 2
#    1 3 4 6 9 2
#    1 2 3 4 6 9