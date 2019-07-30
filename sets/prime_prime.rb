require  'prime'

def prime_prime(array)
  # write your code here
  prime_numbers = []
  h = Hash.new 
  for i in (2...10000) do 
    if i.prime? == true 
      prime_numbers << i
      h[i] = 0
    end
  end
  for i in (0...array.length) do 
    for j in (0...prime_numbers.length) do 
      if array[i] % prime_numbers[j] == 0 
        h[prime_numbers[j]] += 1 
      end
    end
  end 
  prime1 = h.max_by{|k,v| v}
  prime1[0]
end

puts prime_prime([2, 3, 5, 6, 9])
# => 3

puts prime_prime([121, 17, 21, 29, 11, 341, 407, 19, 119, 352])
# => 11

puts prime_prime([7, 6, 7, 3, 77, 14, 28, 35, 42])
# => 7
