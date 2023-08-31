class AddsController < ApplicationController
  def index
  end

  def show
    @add = Add.find(params[:id])
  end
end
