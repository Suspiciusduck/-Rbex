class AddsController < ApplicationController
  def index
  end

  def show
    @add = Add.find(params[:id])
    @image_url = fetch_random_image
  end

  def new
    @add = Add.new
  end
end
