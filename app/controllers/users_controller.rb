class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    # ログインしているユーザーのみ自分のページにアクセスできるようにします
    redirect_to(root_path) unless @user == current_user
    @composite_images = @user.composite_images
  end
end
