class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def is_user_logged_in
  	return session[:user_id]
  end
  
  helper_method :is_user_logged_in

end

