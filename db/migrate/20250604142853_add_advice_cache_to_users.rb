class AddAdviceCacheToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :advice_cache, :text
  end
end
