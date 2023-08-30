class AddsController < ApplicationController
  def index
  end

  def show
    @add = Add.find(params[:id])
    @image_url = fetch_random_image
  end
end
