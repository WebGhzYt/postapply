class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def about
  end

  def contact
  end

  def news
  end
  def post_home_page
    @current_user = current_user
  end
   def show_for_user
    @applys = Apply.all
  
    @posts = Post.all
  end
   def show_for_emp
    
    #@post = Post.find(params[:id])
    @applys = Apply.all
    @posts = Post.all
    
  end

end
