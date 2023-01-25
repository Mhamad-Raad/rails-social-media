class PostsController < ApplicationController
  def index
    @posts = Post.all
    @user = User.find(params[:user_id])
    @comments = Comment.all
  end

  def show; end
end
