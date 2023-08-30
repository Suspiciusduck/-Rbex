class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
    @add = Add.find(params[:add_id])
  end
end
