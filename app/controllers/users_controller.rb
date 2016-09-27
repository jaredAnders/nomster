class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @places = Place.where(user_id: current_user)
  end

end
