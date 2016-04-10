class AddFieldsToSurvey < ActiveRecord::Migration
  def change
    add_column :surveys, :user_id_2, :integer
  end
end
