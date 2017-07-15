class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :set_locale
  helper_method :current_user
  before_filter :require_login

  def set_locale
    I18n.locale = params[:locale] if params[:locale].present?
  end

  def current_user
    if session[:user_id].present?
      User.find(session[:user_id])
    else
      nil
    end
  end

  private

  def require_login
    unless current_user
      redirect_to home_path
    end
  end
end
