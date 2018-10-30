class PostsController < ApplicationController
	include PostsHelper
	def view()
		@post = Post.find(params[:id])
	end

	def new()
		if !is_user_logged_in
			flash[:alert] = "Please log in to make posts"
			redirect_to login_path(0)
		else
			@post = Post.new()

		end
	end

	def create()
		if !is_user_logged_in
			flash[:alert] = "Please log in to make posts"
			#redirect_to login_path(0)
		end
		@post = Post.new()
		@post.user_id=session[:user_id]
		@post.title=params[:title]
		@post.post_type=params[:type]

		if(@post.save)
			if(@post.post_type==1)
				@url = params[:url]
	    		@url = get_image_from_url(@url)
	    		@attachedImage = AttachedImage.new()
	    		@attachedImage.post_id=@post.id
	    		@attachedImage.url=@url
	    		@attachedImage.save()
			end
			for tag in params[:tags].split(",")
				@newTag = Tagged.new()
				@newTag.tag = tag
				@newTag.post_id = @post.id
				@newTag.save
			end
			redirect_to explore_path(0)
		else
			#flash[:alert] = "Posting Failed: did you enter everything correctly?"
			render 'new'
		end
		
	end

	def delete()
		@post = Post.find(params[:id])
		if(session[:user_id]==@post.user_id)
			@post.destroy()
			redirect_to root_path
		end
	end

	private

	def post_params
		params.require(:post).permit(:title,:post_type,:user_id)
	end

end