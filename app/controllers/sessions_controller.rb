class SessionsController < ApplicationController
  def logout
    sign_out(:user)
    redirect_to root_path
  end
end
