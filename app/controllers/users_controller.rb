class UsersController < ApplicationController
  before_action :set_user

  def profile
  end

  def destroy
    @user.destroy
    flash[:notice] = "User was successfully deleted"
    redirect_to admin_users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
