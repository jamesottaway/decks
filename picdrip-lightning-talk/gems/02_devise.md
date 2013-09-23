!SLIDE center
# Devise #
    $ gem install devise

!SLIDE center
    $ rails generate devise:install

!SLIDE center
    @@@ ruby
    current_user

!SLIDE
app/controller/secret_controller.rb
    @@@ ruby
    class SecretController
      before_filter :authenticate_user!
    end

!SLIDE
config/routes.rb
    @@@ ruby
    PicDrip::Application.routes.draw do
      
      devise_for :users
	
	end
