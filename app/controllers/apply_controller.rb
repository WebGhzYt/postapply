class ApplyController < ApplicationController
    #@post = current_user.post.build(post_params)
    #@current_user = current_user.id
    #@post_id = post.id
    
    #@applyed_user = Apply.find(current_user.id && params[:post_id]
      #@post = Post.new(post_params)    # Not the final implementation!
#   #   before_action 	:      user_signed_in?
  def create
  	@applyed_user = Apply.find_by(user_id: current_user.id, post_id: params[:post_id])
  	if @applyed_user == nil
	    @apply = Apply.new(:user_id => current_user.id, :post_id => params[:post_id])
	    if @apply.save
	       flash[:success] = "Applyed successful"
	       	redirect_to posts_path
		   else
		   	flash[:success] = "Could Not Apply Try again"
	      redirect_to posts_path
	    end
  	else
  		  flash[:success] = "Alerday Applied"
  		  redirect_to posts_path		
  	end
  end
  def destroy
    
  end

end
