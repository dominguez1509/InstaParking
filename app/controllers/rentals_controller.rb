class RentalsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @rentals = Rental.all
  end

  def new
    @cities = City.all
    @rental = Rental.new
  end

  def create
    rental = Rental.new(params_rental)
    rental.user_id = current_user.id
    rental.save
    redirect_to :action => :index
  end

  def edit
    @cities = City.all
    @rental = Rental.find(params[:id])
  end

  def update
    rental = Rental.find(params[:id]).update_attributes(params_rental)
    redirect_to :action => :index
  end

  def destroy
    rental = Rental.destroy(params[:id])
    redirect_to :action => :index
  end
  
  def addMoreRows
    @type_of_cars = TypeOfCar.all
    @reg_n = ((Time.now.to_f)*100).to_i
    render(:partial => 'form_row', :layout => false)
  end

  private
  def params_rental
    params.require(:rental).permit(
      :space_quantity, :address, :city_id,spaces_attributes: [
        :id,
        :name,
        :type_of_car_id,
        :price,
        :_destroy
      ]
    )
  end
end