class CreateExerciseRecords < ActiveRecord::Migration[7.2]
  def change
    create_table :exercise_records do |t|
      t.references :user, null: false, foreign_key: true
      t.date :recorded_on
      t.string :activity
      t.integer :duration
      t.integer :calories_burned

      t.timestamps
    end
  end
end
