class PlacesController < ApplicationController

  def index
    @places = Place.order(:created_at).reverse_order.page(params[:page]).per(3)
  end

  def new
    @place = Place.new
  end

end
