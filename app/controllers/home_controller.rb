class HomeController < ApplicationController
	def index
	@current_user = current_user if user_signed_in?
	end

end
