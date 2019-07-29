require 'set'

def number_of_primes(arr)
  # write your code here
  count = 0 
  arr1 = []
  for i in (0...arr.length) do 
    divisiors = 2 
    if arr[i] == 2 
      count +=1 
    end
    while divisiors < arr[i]  do
      if arr[i] % divisiors == 0 
        arr1 << arr[i]
        break
      end 
      divisiors +=1
    end 
    
  end 
  arr.length - arr1.length
end

puts number_of_primes([2, 3, 5, 6, 9])
# => 3

puts number_of_primes([121, 17, 21, 29, 11, 341, 407, 19, 119, 352])
# => 4

puts number_of_primes([7, 6, 7, 3, 77, 14, 28, 35, 42])
# => 3