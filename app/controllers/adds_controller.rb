class AddsController < ApplicationController
  def index
  end

  def show
    @add = Add.find(params[:id])
  end

  def new
    @add = Add.new
  end
end
