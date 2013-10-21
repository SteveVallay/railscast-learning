class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :admin?
end

def admin?
  false
end

def authorize
  unless admin?
    flash[:error] = "unauthorized access"
    redirect_to root_path
    false
  end
end
