class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = I18n.t('users.notifications.created')
      redirect_to user_path(@user)
    else
      flash[:error] = I18n.t('users.notifications.invalid')  

      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = I18n.t('users.notifications.updated')
      redirect_to user_path(@user)
    else
      flash[:error] = I18n.t('users.notifications.invalid')  
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:success] = I18n.t('users.notifications.deleted')
      redirect_to home_path
    else
      flash[:error] = I18n.t('users.notifications.invalid')  
      render 'show'
    end
  end

  def log_in
  end

  def sign_in
    @user = User.find_by_email(params[:user][:email])
    if @user.present? && @user.check_password(params[:user][:password])
    binding.pry


      redirect_to user_path(@user)
    else

      render 'log_in'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
