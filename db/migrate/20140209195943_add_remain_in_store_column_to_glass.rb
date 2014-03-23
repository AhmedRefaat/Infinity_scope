class AddRemainInStoreColumnToGlass < ActiveRecord::Migration
  def change
    add_column :glasses, :remain_in_store, :integer
  end
end
