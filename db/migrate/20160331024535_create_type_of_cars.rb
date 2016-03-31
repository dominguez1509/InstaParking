class CreateTypeOfCars < ActiveRecord::Migration
  def change
    create_table :type_of_cars do |t|
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
