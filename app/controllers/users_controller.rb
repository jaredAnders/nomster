class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.includes(:places, :comments).find(params[:id])
    @places = @user.places
  end

end
