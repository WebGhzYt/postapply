class PostsController < ApplicationController
		before_action :user_signed_in?, only: [:create, :destroy]
 		before_action :correct_user,   only: :destroy

 
		def index
		@posts = Post.all
		#.paginate(page: params[:page])
		#@current_post = current_post
		
		
	end
	def show

		@posts = Post.all
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
