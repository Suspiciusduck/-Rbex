class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.where(user_id: current_user)
  end

  def new
    @reservation = Reservation.new
    @add = Add.find(params[:add_id])
  end

  def create
    @add = Add.find(params[:add_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.add = @add
    @reservation.user = current_user
    if @reservation.save
      redirect_to reservations_path
    else
      render 'reservations/new', status: :unprocessable_entity
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to reservations_path, status: :see_other
  end

  def calcul_price
  end

  private

  def reservation_params
    params.require(:reservation).permit(:check_in, :check_out, :total_price, :add_id)
  end
end
