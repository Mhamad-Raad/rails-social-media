class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def detail
    params[:user_id]
  end
end
