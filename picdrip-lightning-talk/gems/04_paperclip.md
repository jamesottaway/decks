!SLIDE center
# Paperclip #
    $ gem install paperclip

!SLIDE small
app/models/photo.rb

    @@@ ruby
    class Photo

      has_attached_file :image,
        :storage => :s3,
        :s3_credentials => { :access_key_id => XXX,
	                         :secret_access_key => XXX,
	                         :bucket => XXX,
	                         :root_url => XXX },
        :path => "/:filename"

    end

!SLIDE small
app/views/photo/_form.html.haml

    @@@ ruby
    = form_for @p, :html => {multipart: true} do |f|

      .field
	    = f.label :title
	    = f.text_field :title

      .field
	    = f.label :photo
	    = f.file_field :photo

	  .actions
		= f.submit 'Save'
	
