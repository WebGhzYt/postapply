class PostsController < ApplicationController
    before_action :user_signed_in?, only: [:create, :destroy]
    before_action :correct_user,   only: :destroy

 
    def index
    @posts = Post.paginate(page: params[:page], per_page: 10)
    @users = User.all
    @applys = Apply.all
    

    #.paginate(page: params[:page])

    #@current_post = current_post
    
    
  end
  def show
    @users = User.all
    @applys = Apply.all
  
    @posts = Post.paginate(page: params[:page], per_page: 10)
    @current_user = current_user


  #@spe_post = Post.find(params[:id])   
    #@current_post = current_post
  end
  def new

    @current_user = current_user
     @post = Post.new 
  end
  def create
  @post = current_user.post.build(post_params)
    #@post = Post.new(post_params)    # Not the final implementation!
    if @post.save
      # Handle a successful save.
        redirect_to @post
     else
      render 'new'
    end
  end


  def destroy
          if @post.destroy
        flash[:success] = "Post deleted"
        redirect_to @post
      else
        flash[:success] = "Not deleted"
        end 
    end

 def edit
  @current_user = current_user
    @post = Post.find(params[:id])
  end

  def apply
    @posts = Post.paginate(page: params[:page], per_page: 10)
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
        respond_to do |format|
          format.js
        end
      end
    else
        flash[:success] = "Alerday Applied"
        respond_to do |format|
          format.js
        end    
    end
  end
def unapply
  unapply = Apply.find_by_id(:id)
  unapply.destroy
  redirect_to @post
end
def update
    @post = Post.find(params[:id])
 
 
    if @post.update_attributes(post_params)
      flash[:success] = "Post Updated"
      # Handle a successful update.
      redirect_to @post

    else
      render 'edit'
    end
  end
private

    def post_params
      params.require(:post).permit(:title, :experience, :salary,
                                   :post, :note)
    end
def correct_user
      @post = current_user.post.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end
end
