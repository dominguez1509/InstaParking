class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.integer :user_id
      t.integer :space_quantity
      t.string :address

      t.timestamps null: false
    end
  end
end
