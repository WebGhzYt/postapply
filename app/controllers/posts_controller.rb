class PostsController < ApplicationController
		def index
		@posts = Post.all
		#.paginate(page: params[:page])
		#@current_post = current_post
		
		
	end
	def show
		@posts = Post.all
		@current_user = current_user
	end
	def new
		 @post = Post.new	
	end
	def create
    @post = Post.new(post_params)    # Not the final implementation!
    if @post.save
      # Handle a successful save.
      redirect_to @post
    else
      render 'new'
    end
  end
	def destroy
	end


private

    def post_params
      params.require(:post).permit(:title, :experience, :salary,
                                   :post, :note)
    end
end
