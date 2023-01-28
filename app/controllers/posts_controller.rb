class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: params[:user_id]).order(created_at: :desc)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.where(author_id: params[:user_id]).find(params[:id])
  end

  def new
  @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to user_posts_path(@user)
    else
      render :new
    end
  end
end
