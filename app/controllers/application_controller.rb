class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :authenticate_user

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

  def authenticate_user
    if !current_user
      redirect_to log_in_path, alert: 'You have to be logged in'
    end
  end
end
