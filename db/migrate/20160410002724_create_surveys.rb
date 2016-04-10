class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.integer :user_id
      t.integer :type_of_survey
      t.integer :object_score
      t.integer :user_score
      t.string :description

      t.timestamps null: false
    end
  end
end
