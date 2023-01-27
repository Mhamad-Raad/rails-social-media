class UsersController < ApplicationController
  layout 'application'
  def index
    @users = User.all
  end

  def detail
    @user = User.find(params[:user_id])
    @posts = findby
  end
end
