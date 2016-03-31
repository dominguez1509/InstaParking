class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.integer :user_id
      t.string :placa
      t.integer :type_of_car_id
      t.string :description

      t.timestamps null: false
    end
  end
end
