class AddsController < ApplicationController
  def index
  end

  def show
    @add = Add.find(params[:id])
    @markers = [@add].map do |add|
      {
        lat: add.x,
        lng: add.y
      }
    end
  end

  def search
    if params[:query].present?
      @adds = Add.search_by_city(params[:query])
    else
      @adds = Add.all
    end
  end
end
