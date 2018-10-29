class PagesController < ApplicationController

	def home()

	end
	def explore()
		@page = params[:page]

	end
private
  def test2
  	return false
  end

end