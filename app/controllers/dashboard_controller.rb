class DashboardController < ApplicationController
  def index
  end

  def my_blogs
  	id = current_user.id
  	@my_blogs = Blog.where(user_id: id)
  end

  def all_blogs
  	@all_blogs = Blog.all
  end
end
