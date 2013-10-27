require 'date'

opaque_millis      = lambda {            DateTime.now.strftime('%Q').to_i }
transparent_millis = lambda { |datetime| datetime.strftime('%Q').to_i     }

# current = DateTime.now
# transparent_millis[current]
