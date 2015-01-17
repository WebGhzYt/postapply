class ApplyController < ApplicationController
    #@post = current_user.post.build(post_params)
    #@current_user = current_user.id
    #@post_id = post.id
    
    #@applyed_user = Apply.find(current_user.id && params[:post_id]
      #@post = Post.new(post_params)    # Not the final implementation!
#   #   before_action 	:      user_signed_in?\

  def create
    @current_user = current_user
    @applyed_user = Apply.find_by(user_id: current_user.id, post_id: params[:post_id])
    if @applyed_user == nil
	    @apply = Apply.new(:user_id => current_user.id, :post_id => params[:post_id],:apply => true)
	    if @apply.save
	      flash[:success] = "Applyed successful"
     			#mail sending code 
        ApplyMailer.welcome_email(@current_user).deliver
        #@posted_user = "engrohitjain5@gmail.com"
        @posted_user = "engrohitjain5@gmail.com"
          @posts  = Post.all
          @users = User.all
          @posts.each do |post|
            if @apply.post_id == post.id
                @sender_poster_id = post.user_id
                @users.each do |user|
                if @sender_poster_id == user.id
                  @posted_user = user
                  break
                end
            end
          end

     end
      ApplyMailer.emp_email(@posted_user).deliver
      redirect_to posts_path
        #@posts.each do |post|
        #if post.id == @apply.post_id

        #else
        #end
        
    
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

private
  def work
      
  end
end
