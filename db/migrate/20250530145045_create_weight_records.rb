class CreateWeightRecords < ActiveRecord::Migration[7.2]
  def change
    create_table :weight_records do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal :weight
      t.date :recorded_on

      t.timestamps
    end
  end
end
