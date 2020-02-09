class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(title: params[:blog][:title], content: params[:blog][:content], user_id: current_user.id)
    @blog.save
    redirect_to blogs_path
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
