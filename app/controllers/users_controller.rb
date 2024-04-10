class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    # ログインしているユーザーのみ自分のページにアクセスできるようにします
    redirect_to(root_path) unless @user == current_user
    @composite_images = @user.composite_images
  end

  def destroy
    @user = User.find(params[:id])
    if @user == current_user
      @user.destroy
      redirect_to root_path, notice: t('messages.users.destroy_success')
    else
      redirect_to root_path, alert: t('messages.users.destroy_danger')
    end
  end
end
