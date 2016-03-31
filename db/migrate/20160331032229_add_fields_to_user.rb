class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :names, :string
    add_column :users, :last_names, :string
    add_column :users, :type_of_user_id, :integer
  end
end
