class PagesController < ApplicationController

	def home()
		if !is_user_logged_in
			redirect_to explore_path(0)
		end
	end
	def explore()
		@page = params[:page]
		@posts = Post.order('created_at')
	end
private


end