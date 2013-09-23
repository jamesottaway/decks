!SLIDE center
# What? #

![tool](images/tool.jpg)

.notes test-driven sysadmin
- system automation tool
- executable documentation


!SLIDE center
# Install It #

    curl babushka.me/up | sh

.notes Uses Babushka to install Babushka
- No dependencies
- Bootstraps Ruby from the install script
- Bootstraps other dependencies using temporary Babushka

!SLIDE center
# Run It #

    $ babushka rubygems

    $ babushka homebrew

!SLIDE bullets center incremental
# Sharing is Caring #

    $ babushka that_guy:his_dep
* https://github.com/that_guy/babushka-deps
* ~/.babushka/sources/that_guy

!SLIDE bullets
# Memory Optimisation #

* How do I start the Mongrel server?
* What about the Jetty server?
* Wait, have we upgraded it yet?

.notes Important questions, but I don't want to have to remember the answers to them

!SLIDE bullets
# Memory Optimised! #

* babushka 'start mongrel'
* babushka 'start jetty'
* babushka 'jetty upgraded'

.notes So we document the steps to accomplish the task and only remember the name we give it
