!SLIDE center
# Protip #

!SLIDE small
# Beware of Variables #

    @@@ ruby

    dep 'beware' do      
      ...
      processes = shell 'ps'

      met? { processes.include? 'ruby' }
      ...
    end

.notes Evaluated early and won't change
- You probably want a method/function

!SLIDE small
# Don't Reinvent the Wheel #

    @@@ ruby

    dep 'wheel' do
      ...
      meet { shell "echo 'foo' > bar" }
      ...
    end

.notes Use the Helpers

!SLIDE small
# What Did I Just Tell You?! #

    @@@ ruby

    meta 'apt' do
      accepts_value_for :package

      template {
      	...
      	meet { sudo "apt-get install #{package}" }
      	...
	  }
    end

.notes Use the built-in meta deps

!SLIDE small
# Last Responsible Moment #

    @@@ ruby
    dep 'install it' do
      # things
    end

    dep 'symlink it' do
      # other things
    end

    dep 'it'
      requires 'install it', 'symlink it', 'love it'
    end

.notes Depend on things where they are needed
- Let Babushka figure the rest out

!SLIDE small
# Versions and Symlinks #

    @@@ ruby
      dep 'RubyMine-3.2.4 installed' do
        # install it
      end

      dep 'RubyMine symlinked to v3.2.4' do
        requires 'RubyMine-3.2.4 installed'
        # symlink it
      end

      dep 'RubyMine' do
        requires 'RubyMine symlinked to v3.2.4',
                              'other RubyMine things'
      end

.notes New version means you install the new version and switch the symlink