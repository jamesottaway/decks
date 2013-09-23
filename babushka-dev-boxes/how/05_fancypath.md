!SLIDE small
# Fancypath To The Rescue #
        @@@ ruby
        class Fancypath < Pathname
          module Helpers
            # magic
          end
    
          # more magic
        end
    
        class String
          include Fancypath::Helpers
        end

!SLIDE center small
# Monkey Violence #
    @@@ ruby
    '~/.ssh'.to_fancypath

!SLIDE center spread
# Let The Magic Begin #

    all_children
    append, write and touch
    copy and move
    empty? (versus #zero?)
    group and owner
    remove (versus #delete and #rmdir)
    hypothetically_writable?
