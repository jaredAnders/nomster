class PlacesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  def index
    @places = Place.order(:created_at).reverse_order.page(params[:page]).per(3)
  end

  def new
    @place = Place.new
  end

  def create
    current_user.places.create(place_params)
    redirect_to root_path
  end

  def show
    @place = Place.find(params[:id])
  end

  def edit
    @place = Place.find(params[:id])

    if @place.user != current_user
      return render :file => "#{Rails.root}/public/404.html",  :status => 404
    end
  end

  def update
    @place = Place.find(params[:id])

    if @place.user != current_user
      return render :file => "#{Rails.root}/public/404.html",  :status => 404
    end

    @place.update_attributes(place_params)
    redirect_to place_path(@place)
  end

  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    redirect_to root_path
  end

  private

  def place_params
    params.require(:place).permit(:name, :description, :address)
  end

end
