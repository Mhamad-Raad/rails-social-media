class UsersController < ApplicationController
  def index; end

  def detail
    params[:user_id]
  end
end
