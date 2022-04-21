class LikesController < ApplicationController
  before_action :find_post
  def create
    @touc.likes.create(user_id: current_user.id)
    redirect_to post_path(@touc)
  end
  private
  def find_touc
    @touc = Touc.find(params[:touc_id])
  end
end
