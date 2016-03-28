class CreateSpaces < ActiveRecord::Migration
  def change
    create_table :spaces do |t|
      t.integer :rental_id
      t.integer :type_of_car

      t.timestamps null: false
    end
  end
end
