class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :destroy]
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id

    if params[:back]
      render :new
      return
    end

    if @blog.save
      redirect_to blogs_path, notice: "ブログを作成しました！"
    else
      render new_blog_path
    end

  end


  def confirm
    @blog = Blog.new(blog_params)
    render :new  if @blog.invalid?
  end

  def show
  end

  def edit
  end

  def update
    set_blog
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "ブログを編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"ブログを削除しました！"
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :content)
  end
end
