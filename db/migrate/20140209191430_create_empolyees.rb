class CreateEmpolyees < ActiveRecord::Migration
  def change
    create_table :empolyees do |t|
      t.string :name
      t.string :phone
      t.string :mobile
      t.string :address
      t.string :national_id
      t.string :mobile_2
      t.date :birthday
      t.integer :age
      t.string :role
      t.decimal :salary
      t.text :comment

      t.timestamps
    end
  end
end
