!SLIDE center
# How? #

![magic](images/magic.jpg)

.notes declarative dsl
- single, context-isolated "dep"
- idempotent

!SLIDE small
# A Dep #
    @@@ ruby
    dep 'name' do
      requires 'another dep'
      met? {
        # that is the question!
      }
      meet {
        # y'all ready for this?
      }
    end

!SLIDE small
# A Real Dep #
    @@@ ruby
    dep 'firefox' do
      met? { shell 'which firefox' }
      meet {
	    log 'Installing Firefox...'
	    shell 'sudo apt-get install -y firefox'
	  }
    end

!SLIDE small
# Run It #
    $ babushka firefox

	firefox {
	  meet {
		Installing Firefox...
	  }
	} ✓ firefox

!SLIDE small
# Run It Again #
    $ babushka firefox

	firefox {
	} ✓ firefox

!SLIDE small
# That Dep Again #
    @@@ ruby
    dep 'firefox' do
      met? { shell 'which firefox' }
      meet {
        log 'Installing Firefox...'
        shell 'sudo apt-get install -y firefox'
      }
    end

.notes NEXT: Helpers
	
!SLIDE bullets
# Shell Helpers #

* shell!
* shell?
* raw_shell
* sudo
* which
* cmd_dir

!SLIDE bullets
# Run Helpers #

* append\_to\_file
* bundle_rake
* change\_with\_sed
* grep
* hostname

!SLIDE bullets
# Package Helpers #

* has?
* install!
* update\_pkg\_lists

.notes apt, brew, gems, macports, npm, pacman, pip, yum

!SLIDE small
# That Dep Again w/ Helpers #
    @@@ ruby
    dep 'firefox' do
      met? { which 'firefox' }
      meet {
        log 'Installing Firefox...'
        sudo 'apt-get install -y firefox'
      }
    end

.notes NEXT: Duplicate dep for Chrome

!SLIDE small
# Another Dep #
    @@@ ruby
    dep 'chrome' do
      met? { which 'chrome' }
      meet {
        log 'Installing Chrome...'
        sudo 'apt-get install -y chrome'
      }
    end

.notes NEXT: Meta dep example

!SLIDE small
# Let's Get Meta #
    @@@ ruby
    meta 'apt' do
      accepts_value_for :package
      
      template {
	    met? { which package }
	    meet {
		  log 'Installing #{package}...'
		  sudo "apt-get install -y #{package}"
		}
      }
    end

.notes Dynamically/lazily loaded against the dep that references it at runtime

!SLIDE small
# Put It To Good Use #
    @@@ ruby
    dep 'firefox', :template => 'apt' do
      package 'firefox'
    end

    dep 'firefox.apt' do
      package 'firefox'
    end

.notes Wait, that's not very DRY

!SLIDE small
# Keep It DRY #
    @@@ ruby
    meta 'apt' do
      accepts_value_for :package, :name
      
      template {
        met? { which package }
        meet {
          log "Installing #{package}..."
          sudo "apt-get install -y #{package}"
        }
      }
    end

.notes NEXT: Show old 'firefox.apt' dep example again

!SLIDE small
# Put It To Good Use (Again) #
    @@@ ruby
    dep 'firefox', :template => 'apt' do
      package 'firefox'
    end

    dep 'firefox.apt' do
      package 'firefox'
    end

!SLIDE small
# Keeping Things Dry #
    @@@ ruby
    dep 'firefox', :template => 'apt'

    dep 'firefox.apt'

!SLIDE small
# Tying It All Together #

    @@@ ruby
    dep 'firefox.apt'

    dep 'chrome.apt'

    dep 'browsers' do
      requires 'firefox.apt', 'chrome.apt'
    end

!SLIDE verysmall
# Anatomy of a Dep #
        @@@ ruby
        dep 'mammoth' do
          setup {
            log 'Setup...'
            @status = false
          }
          requires 'another dep'
          met? {
            log "Status: #{@status}"
            @status
          }
          prepare { log 'Preparing...' }
          requires_when_unmet 'config dep'
          before { log 'Before...' }
          meet {
            log 'Setting @status to true'
            @status = true
          }
          after { log 'After...' }
        end

!SLIDE verysmall
# And You Get... #
        $ babushka mammoth

        mammoth {
          Setup...
          another dep {
            Hi from 'another dep'
          } ✓ another dep
          Status: false
          Preparing...
          config dep {
            Hi from 'config dep'
          } ✓ config dep
          meet {
            Before...
            Setting @status to true
            After...
          }
          Status: true
        } ✓ mammoth