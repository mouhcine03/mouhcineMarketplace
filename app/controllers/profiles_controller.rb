class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  
  def show
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      redirect_to profile_path, notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end
  
  private
  
  def set_user
    @user = current_user
  end
  
 def user_params
  up = params.require(:user).permit(:name, :email, :phone, :password, :password_confirmation)
  if up[:password].blank?
    up.delete(:password)
    up.delete(:password_confirmation)
  end
  up
end
end