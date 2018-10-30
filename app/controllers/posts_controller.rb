class PostsController < ApplicationController

	def view()
		@post = Post.find(params[:id])
	end

	def new()
		if !is_user_logged_in
			flash[:alert] = "Please log in to make posts"
			redirect_to login_path(0)
		end
	end

	def create()
		if !is_user_logged_in
			flash[:alert] = "Please log in to make posts"
			redirect_to login_path(0)
		end
	end

	def delete()

	end

end