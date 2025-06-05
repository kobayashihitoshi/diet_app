class CreateFoodRecords < ActiveRecord::Migration[7.2]
  def change
    create_table :food_records do |t|
      t.references :user, null: false, foreign_key: true
      t.date :recorded_on
      t.string :meal_type
      t.string :menu
      t.integer :calories

      t.timestamps
    end
  end
end
