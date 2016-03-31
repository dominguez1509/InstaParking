class AddPriceToSpace < ActiveRecord::Migration
  def change
    add_column :spaces, :price, :float, :limit => 25
    rename_column :spaces, :type_of_car, :type_of_car_id
  end
end
