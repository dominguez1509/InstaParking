class CitiesController < ApplicationController
  before_filter :authenticate_user!
  def index
    @cities = City.all
  end

  def new
    @city = City.new
  end

  def create
    city = City.new(params_city)
    city.save
    redirect_to :action => :index
  end

  def edit
    @city = City.find(params[:id])
  end

  def update
    city = City.find(params[:id]).update_attributes(params_city)
    redirect_to :action => :index
  end

  def destroy
    city = City.destroy(params[:id])
    redirect_to :action => :index
  end

  private
  def params_city
    params.require(:city).permit(
      :name, :code
    )
  end
end