ONE = 1;

add    = lambda { |x, y| x + y }   # referentially transparent

addOne = lambda { |x| add[x, ONE] }   # referentially opaque

# addOne[9]     (returns 10)
# ONE = 0
# addOne[9]     (returns 9)
