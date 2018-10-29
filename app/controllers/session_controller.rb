class SessionController < ApplicationController

	def new()
		@user = User.new
	end
	def create()
		#render plain: params.inspect
		@username=params[:username]
		@password=params[:password]
		@user = User.find_by(username: @username, password: @password)
		if(!!@user)
			session[:user_id]=@user.id
			redirect_to root_path
		else
			flash[:alert] = "Incorrect User/Password combination"
			redirect_to login_path
		end
	end
	def destroy()
		reset_session
		redirect_to root_path
	end


end