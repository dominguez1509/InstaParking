class ReservationsController < ApplicationController
  before_filter :authenticate_user!
  def index
    if current_user.type_of_user_id == 2
      @reservations = Reservation.where("user_id = ?",current_user.id)
    else
      @reservations = Reservation.where("space_id IN(SELECT id FROM spaces WHERE rental_id IN(SELECT id FROM rentals WHERE user_id = ?))",current_user.id)
    end
  end

  def new
    @cars = Car.where("user_id = ?",current_user.id)
    @cities = City.all
    @reservation = Reservation.new
  end

  def create
    reservation = Reservation.new(params_reservation)
    reservation.user_id = current_user.id
    reservation.status = "waiting"
    reservation.owner_survey = 0
    reservation.user_survey = 0
    fechadereserva = params[:fecha].to_date
    reservation.start_hour = Time.new(fechadereserva.year,fechadereserva.month,fechadereserva.day, params[:timepicker1][0...2], params[:timepicker1][3...5], 00)
    reservation.end_hour = Time.new(fechadereserva.year,fechadereserva.month,fechadereserva.day, params[:timepicker1][0...2], params[:timepicker1][3...5], 00)
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
  
  def complete
    car_type = Car.find(params[:car]).type_of_car_id
    city = params[:city]
    @combo=Array.new
    @spaces = Space.where("type_of_car_id = ? AND rental_id IN(SELECT id FROM rentals WHERE city_id = ?)",car_type,city)
    @spaces.each do |x|
      @combo << { 'id' => x.id, 'name' => x.name.to_s + 'Direccion: ' + Rental.find(x.rental_id).address.to_s + ' S/.' + x.price.to_s}
    end
    render json: {:combo => @combo}
  end
  
  def accept
    reservation = Reservation.find(params[:id])
    reservation.status = "accepted"
    reservation.save
    redirect_to :action => :index
  end
  
  def reject
    reservation = Reservation.find(params[:id])
    reservation.status = "rejected"
    reservation.save
    redirect_to :action => :index
  end
  
  def charged
    reservation = Reservation.find(params[:id])
    reservation.status = "charged"
    reservation.save
    redirect_to :action => :index
  end
  
  def fill_survey_owner
    reservation = Reservation.find(params[:id])
    reservationuser = Rental.find(Space.find(reservation.space_id).rental_id).user_id
    reservationuser2 = reservation.user_id
    redirect_to url_for(:controller => :surveys, :action => :new, :reservation_id => params[:id], :user_id => reservationuser, :user_id_2 => reservationuser2, :type_of_survey => 1)
  end
  
  def fill_survey_user
    reservation = Reservation.find(params[:id])
    reservationuser = reservation.user_id
    reservationuser2 = Rental.find(Space.find(reservation.space_id).rental_id).user_id
    redirect_to url_for(:controller => :surveys, :action => :new, :reservation_id => params[:id], :user_id => reservationuser, :user_id_2 => reservationuser2, :type_of_survey => 2)
  end

  private
  def params_reservation
    params.require(:reservation).permit(
      :car_id,:space_id,:fecha,:timepicker1,:timepicker2, :user_id
    )
  end
end