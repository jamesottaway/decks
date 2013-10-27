numbers = [1,2,3,4,5]
x = 0

for i in 1..numbers.length-1 do
	x + numbers[i]
end

puts x

# numbers.reduce { |acc, x| acc + x }
# or
# numbers.reduce(&:+)