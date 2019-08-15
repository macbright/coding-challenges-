def full_counting_sort(array)
  hash = Hash.new(0)
  sorted_array = []
  (0..99).each { |i| array.each {|val| hash[i] += 1 if val.split.shift.to_i <= i}}
  hash.keys.each {|key| array.each {|val| sorted_array << val.split(" ")[1] if val.split.shift.to_i == key}}
  sorted_array
end

p full_counting_sort(["0 ab", "6 cd", "0 ef", "6 gh", "4 ij", "0 ab", "6 cd", "0 ef", "6 gh", "0 ij", "4 that", "3 be", "0 to", "1 be", "5 question", "1 or", "2 not", "4 is", "2 to", "4 the"])
# => ["ab", "ef", "ab", "ef", "ij", "to", "be", "or", "not", "to", "be", "ij", "that", "is", "the", "question", "cd", "gh", "cd", "gh"]