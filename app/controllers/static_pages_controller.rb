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
end