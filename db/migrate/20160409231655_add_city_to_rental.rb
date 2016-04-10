class AddCityToRental < ActiveRecord::Migration
  def change
    add_column :rentals, :city_id, :integer
  end
end
