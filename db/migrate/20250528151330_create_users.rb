class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.decimal :current_weight
      t.decimal :target_weight
      t.integer :age
      t.string :gender

      t.timestamps
    end
  end
end
