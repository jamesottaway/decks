!SLIDE center
# CanCan #
    $ gem install cancan

!SLIDE center
    $ rails generate cancan:ability

!SLIDE code small
app/models/ability.rb

    @@@ ruby
    class Ability
	  include CanCan::Ability

	  def initialize user
	    user ||= User.new
	    can :manage, Album, :user_id => user.id
	    can :manage, Photo, :album => \
	                           { :user_id => user.id }
	  end
	end

!SLIDE code small
app/controllers/photos_controller.rb

    @@@ ruby
        class PhotosController
          def show
            @photo = Photo.find params[:id]
            authorize_resource @photo
          end
        end

!SLIDE code small
app/controllers/photos_controller.rb

    @@@ ruby
        class PhotosController
          load_and_authorize_resource :photo

          def show; end
        end