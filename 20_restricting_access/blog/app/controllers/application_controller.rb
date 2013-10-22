class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :admin?
end

def admin?
  #request.remote_ip == "10.231.216.45"
  #request.remote_ip == "127.0.0.1"
  session[:password] == 'admin'
end

def authorize
  unless admin?
    flash[:error] = "unauthorized access"
    redirect_to root_path
    false
  end
end
