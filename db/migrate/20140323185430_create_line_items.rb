class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :glass_id
      t.string :customer_id
      t.string :integer
      t.integer :quantity

      t.timestamps
    end
  end
end
