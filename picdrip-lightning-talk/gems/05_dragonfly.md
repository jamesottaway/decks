!SLIDE center
# Dragonfly #
    $ gem install dragonfly

!SLIDE small
config/initializers/dragonfly.rb

    @@@ ruby
    require 'dragonfly'

	app = Dragonfly[:images]

	app.configure_with :imagemagick
	app.configure_with :rails
	app.configure_with :heroku, 'flickr_drip_feed' \
	                         if Rails.env.production?

	app.define_macro ActiveRecord::Base, \
		                             :image_accessor

!SLIDE small
app/models/photo.rb

    @@@ ruby
        class Photo

          image_accessor :image

        end

!SLIDE code small

    $ heroku config:add S3_KEY=XXXXX

    $ heroku config:add S3_SECRET=XXXXX

    $ heroku config:add S3_BUCKET=XXXXX