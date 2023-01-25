class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def detail
    @user = User.find params[:user_id]
    @posts = Post.where(user_id: @user.id)
  end
end
