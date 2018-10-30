class PostsController < ApplicationController

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
			redirect_to login_path(0)
		end
		@post = Post.new()
		@post.user_id=session[:user_id]
		@post.title=params[:title]
		@post.post_type=params[:type]
		if(@post.save)
			redirect_to explore_path(0)
		else
			render 'new'
		end
		
	end

	def delete()

	end

	private

	def post_params
		params.require(:post).permit(:title,:post_type,:user_id)
	end

end