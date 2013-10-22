class SessionsController < ApplicationController
  def new
  end
  def create
    session[:password] = params[:password]
    flash[:notice] = "Successfully logged in"
    redirect_to root_path
  end

  def destroy
    session[:password] = nil
    flash[:notice] = "Successfully logged out"
    redirect_to login_path
  end
end
