a = 1
b = 2

# c should equal the sum of `a` and `b`
unreactive_c = a + b
reactive_c = -> { a + b }

puts "unreactive c: #{unreactive_c}"
puts "reactive c: #{reactive_c[]}"

# now let's change the value of `a` and `b`
a = a * 2
b = b * 2

puts "unreactive c: #{unreactive_c}"
puts "reactive c: #{reactive_c[]}"
