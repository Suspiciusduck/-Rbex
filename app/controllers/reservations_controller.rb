class ReservationsController < ApplicationController
<<<<<<< HEAD

  def index
    @reservations = Reservation.where(user_id: current_user)
  end

=======
>>>>>>> 870005055aa49c2ec789b722e3ac2092b49b80a7
  def new
    @reservation = Reservation.new
    @add = Add.find(params[:add_id])
  end
<<<<<<< HEAD

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

  private

  def reservation_params
    params.require(:reservation).permit(:check_in, :check_out, :total_price, :add_id)
  end
=======
>>>>>>> 870005055aa49c2ec789b722e3ac2092b49b80a7
end
