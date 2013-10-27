def counter
	x = 0
	return lambda { |y|
		x += y
		puts x
	}
end

first_counter  = counter
second_counter = counter

puts "first"
first_counter.call(1)   # return 1
first_counter.call(2)   # return 3
first_counter.call(3)   # return 6

puts "second"
second_counter.call(5)   # return 5
second_counter.call(5)   # return 10
second_counter.call(5)   # return 15
