!SLIDE center
# FlickRaw #
    $ gem install flickraw

or

    $ gem install flickraw-cached

!SLIDE code small
    @@@ ruby
    FlickRaw.api_key = CONFIG[:flickr_api_key]

	FlickRaw.shared_secret = CONFIG[:flickr_api_secret]
	
	
	
	flickr = FlickRaw::Flickr.new

!SLIDE code small
    @@@ ruby
    def auth
     frob = flickr.auth.getFrob
     redirect_to FlickRaw.auth_url :frob => frob,
                                     :perms => 'write'
    end

!SLIDE code small
    @@@ ruby
    def callback
     auth = flickr.auth.getToken :frob => params[:frob]
     login = flickr.test.login

     current_user.token = auth.token
     current_user.save

     redirect_to user_path
    end

!SLIDE small
    @@@ ruby
	flickr.auth.checkToken :auth_token => \
	                                current_user.token


	flickr.upload_photo 'cool.jpg', :title => ‘Cool!’
	 