class UsersController < ApplicationController
  def show
    @user = User.fing(params[:id])
    @users = User.all_execpt(current_user)
  end
end
