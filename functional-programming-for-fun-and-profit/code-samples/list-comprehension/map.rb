source = [1,2,3,4,5]
destination = []

for i in 0..source.length-1 do
  destination << source[i]*2
end

puts destination

# puts source.map { |i| i * 2 }