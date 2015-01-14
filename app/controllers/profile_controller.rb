class ProfileController < ApplicationController
		def index
		@users = User.all
		#.paginate(page: params[:page])
		@current_user = current_user
		
		
	end
	def show
		@user = User.find(params[:id])
	end
	def destroy
		
		@user = User.find(params[:id])
		
  		flash[:success] = "User deleted"
    	redirect_to root_url
  
	end

end
