class AddReservationToSurvey < ActiveRecord::Migration
  def change
    add_column :surveys, :reservation_id, :integer
  end
end
