class CreateGlassStoreLinks < ActiveRecord::Migration
  def change
    create_table :glass_store_links do |t|
      t.integer :glass_id
      t.integer :store_id
      t.integer :quantity

      t.timestamps
    end
  end
end
