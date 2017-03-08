class ApplicationController < ActionController::Base
  helper_method :current_user
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def welcome
    unless current_user
      redirect_to login_path
    end
  end

  def current_user
    session[:name]
  end

  def require_login
    redirect_to '/login' if current_user.blank?
  end

end
