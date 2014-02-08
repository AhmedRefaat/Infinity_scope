class CreateGlasses < ActiveRecord::Migration
  def change
    create_table :glasses do |t|
      t.string :frame_kind
      t.string :made_in
      t.integer :quantity
      t.decimal :unity_price
      t.decimal :discount_rate
      t.string :type
      t.decimal :discount_rate_2
      t.integer :model

      t.timestamps
    end
  end
end
