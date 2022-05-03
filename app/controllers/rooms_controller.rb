class RoomsController < ApplicationController
  before_action :user_signed_in?
  def index
    @rooms = Room.public_rooms
    @users = User.all_except(current_user)
  end
end
