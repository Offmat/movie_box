class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :admin?
  helper_method :user_name

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def admin?
    User.find(session[:user_id]).admin if current_user
  end

  def user_name
    current_user.email || "Guest"
  end
end
