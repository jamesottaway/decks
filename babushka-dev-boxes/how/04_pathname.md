!SLIDE small
# Pathname #
    @@@ ruby
    require 'pathname'
    
    ruby = Pathname.new '/usr/bin/ruby'

	ruby.size               # 34608
	ruby.directory?         # false
	ruby.dirname            # '/usr/bin'
	ruby.basename           # 'ruby'
	ruby.split              # [#<Pathname:/usr/bin>,
                                      #<Pathname:ruby>]

!SLIDE small
# But wait, there's more! #
    @@@ ruby
    p1 = Pathname.new '/usr/lib'
     => #<Pathname:/usr/lib>

	p2 = p1 + 'ruby/1.8'
     => #<Pathname:/usr/lib/ruby/1.8>

	p3 = p1.parent
     => #<Pathname:/usr>

	p4 = p2.relative_path_from p3
     => #<Pathname:lib/ruby/1.8>

!SLIDE small
# Until It All Comes Crashing Down #
    @@@ ruby
    require 'pathname'
    
    ruby = Pathname.new '/usr/bin/ruby'

    ruby.copy 'somewhere'   # NoMethodError
    ruby.move 'over there'  # NoMethodError
    ruby.empty?             # NoMethodError
    ruby.exists?            # NoMethodError