class PostsController < ApplicationController
  def index
    @posts = Post.all
    @comments = Comment.all
    @user = User.find(params[:user_id])
  end

  def show;
    @post = Post.find_by(params[post_id])
    @comments = Comment.all
    @user = User.find(params[:user_id])
  end
end
