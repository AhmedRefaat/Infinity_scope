class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :title
      t.string :address
      t.string :phone
      t.string :mobile

      t.timestamps
    end
  end
end
