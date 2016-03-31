class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :car_id
      t.integer :space_id
      t.integer :start_hour
      t.integer :end_hour
      t.string :status

      t.timestamps null: false
    end
  end
end
