def hash_table(arr)
  # h = Hash.new{ |h, k| h[k] = [] }
  newarr = []
  arr1 = []
  for i in (0...arr.length) do 
    newarr << []
  end
  for i in (0...arr.length) do 
    newarr << []
    mod = (arr[i]).abs % 11
    newarr[mod] << (arr[i])
  end 
  for i in (0...newarr.length) do 
    for j in (0...newarr[i].length) do 
      arr1 << newarr[i][j]
    end
  end 
  
  arr1

  # print newarr
end

p hash_table([12, 24, 125, 5, 91, 1106, 2, 1021, 29, 3536, 10])
# => [12, 24, 2, 91, 125, 5, 3536, 1106, 29, 1021, 10]

p hash_table([2, 341, 73, 8265, 234004, 602, 7400000, 200000000])
# => [341, 234004, 2, 200000000, 7400000, 8265, 73, 602]