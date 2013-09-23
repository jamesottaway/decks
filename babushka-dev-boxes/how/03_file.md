!SLIDE center
# What Comes In #
# Must Go Out #

a.k.a File IO

!SLIDE small
# Ruby Core #
    @@@ ruby
    ruby = File.new '/usr/bin/ruby'

	ruby.size               # 34608
	ruby.directory?         # NoMethodError
	ruby.dirname            # NoMethodError
	ruby.parent             # NoMethodError