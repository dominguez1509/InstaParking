class SurveysController < ApplicationController
  before_filter :authenticate_user!
  def index
    @surveys = Survey.all
  end

  def new
    @reservation_id = params[:reservation_id]
    @user_id = params[:user_id]
    @user_id_2 = params[:user_id_2]
    @type_of_survey = params[:type_of_survey]
    @survey = Survey.new
  end

  def create
    survey = Survey.new(params_survey)
    survey.save
    reservation = Reservation.find(survey.reservation_id)
    if survey.type_of_survey == 1
      reservation.owner_survey = 1
    else
      reservation.user_survey = 1
    end
    reservation.save
    redirect_to :action => :index
  end

  def edit
    @survey = Survey.find(params[:id])
  end

  def update
    survey = Survey.find(params[:id]).update_attributes(params_survey)
    redirect_to :action => :index
  end

  def destroy
    survey = Survey.destroy(params[:id])
    redirect_to :action => :index
  end
  
  def show
    @survey = Survey.find(params[:id])
  end

  private
  def params_survey
    params.require(:survey).permit(
      :user_id,:type_of_survey,:object_score,:user_score,:description,:user_id_2,:reservation_id
    )
  end
end