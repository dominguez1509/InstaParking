class CarsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @cars = Car.all
  end

  def new
    @type_of_cars = TypeOfCar.all
    @car = Car.new
  end

  def create
    car = Car.new(params_car)
    car.user_id = current_user.id
    car.save
    redirect_to :action => :index
  end

  def edit
    @type_of_cars = TypeOfCar.all
    @car = Car.find(params[:id])
  end

  def update
    car = Car.find(params[:id]).update_attributes(params_car)
    redirect_to :action => :index
  end

  def destroy
    car = Car.destroy(params[:id])
    redirect_to :action => :index
  end

  private
  def params_car
    params.require(:car).permit(
      :placa, :type_of_car_id, :description
    )
  end
end