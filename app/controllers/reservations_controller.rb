class ReservationsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @reservations = Reservation.all
  end

  def new
    @cars = Car.all
    @spaces = Space.all
    @reservation = Reservation.new
  end

  def create
    reservation = Reservation.new(params_reservation)
    reservation.user_id = current_user.id
    reservation.status = "waiting"
    reservation.save
    redirect_to :action => :index
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    reservation = Reservation.find(params[:id]).update_attributes(params_reservation)
    redirect_to :action => :index
  end

  def destroy
    reservation = Reservation.destroy(params[:id])
    redirect_to :action => :index
  end

  private
  def params_reservation
    params.require(:reservation).permit(
      :car_id,:space_id,:start_hour,:end_hour
    )
  end
end