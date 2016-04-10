class ChangeTypeOfTimestampForReservation < ActiveRecord::Migration
  def change
    change_column :reservations, :start_hour, :datetime
    change_column :reservations, :end_hour, :datetime
  end
end
