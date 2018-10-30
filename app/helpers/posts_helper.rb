module PostsHelper
	IMAGE_NOT_FOUND = 'http://www.piniswiss.com/wp-content/uploads/2013/05/image-not-found-4a963b95bf081c3ea02923dceaeb3f8085e1a654fc54840aac61a57a60903fef-300x199.png'
	
	def get_image_from_post(id)
		@attached_image_entry= AttachedImage.find_by(post_id: id)
		if(@attached_image_entry)
			@url=@attached_image_entry.url
			return @url
		end
		return IMAGE_NOT_FOUND
	end
	
	def get_image_from_url(url)
	    @url = IMAGE_NOT_FOUND unless ((File.extname(url) =~/^(.png|.gif|.jpg)$/ )||(url =~ /^#{URI::regexp}$/))
	    return @url
	end
end
