class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_email(params[:session][:email])
    if @user.present? && @user.check_password(params[:session][:password])
      session[:user_id] = @user.id
      flash[:success] = I18n.t('.sessions.notifications.created')
      redirect_to user_path(@user)
    else
      flash[:error] = I18n.t('sessions.notifications.invalid')
      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to log_in_path
  end
end