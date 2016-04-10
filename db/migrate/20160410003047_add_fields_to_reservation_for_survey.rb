class AddFieldsToReservationForSurvey < ActiveRecord::Migration
  def change
    add_column :reservations, :owner_survey, :integer
    add_column :reservations, :user_survey, :integer
  end
end
