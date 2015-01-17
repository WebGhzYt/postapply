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
@post_by_title = Post.find_by_title(:title)
  end

   def show_for_emp
    @applys = Apply.all
  
    @posts = Post.all
    @post_by_title = Post.find_by_title(:title)


    #@current_user = current_user
    #@post = Post.find(params[:id])

  end

end
