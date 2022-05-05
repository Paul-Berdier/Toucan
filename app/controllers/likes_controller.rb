class LikesController < ApplicationController
  before_action :find_touc
  def create
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @touc.likes.create(user_id: current_user.id)
    end
    redirect_to touc_path(@touc)
  end
  private
  def find_touc
    @touc = Touc.find(params[:touc_id])
  end
  def already_liked?
    Like.where(user_id: current_user.id, touc_id:
      params[:touc_id]).exists?
  end

  def destroy
    if !(already_liked?)
      flash[:notice] = "Cannot unlike"
    else
      @touc.destroy
    end
    redirect_to touc_path(@touc)
  end

  def index
    @likes = Like.all.order("created_at DESC")
    @like = Like.new
  end
end
