class TypeOfCarsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @type_of_cars = TypeOfCar.all
  end

  def new
    @type_of_car = TypeOfCar.new
  end

  def create
    type_of_car = TypeOfCar.new(params_type_of_car)
    type_of_car.save
    redirect_to :action => :index
  end

  def edit
    @type_of_car = TypeOfCar.find(params[:id])
  end

  def update
    type_of_car = TypeOfCar.find(params[:id]).update_attributes(params_type_of_car)
    redirect_to :action => :index
  end

  def destroy
    type_of_car = TypeOfCar.destroy(params[:id])
    redirect_to :action => :index
  end

  private
  def params_type_of_car
    params.require(:type_of_car).permit(
      :name, :description
    )
  end
end