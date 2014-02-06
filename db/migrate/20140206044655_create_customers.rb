class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :phone
      t.datetime :delivery_date
      t.string :work
      t.integer :mobile
      t.string :address
      t.datetime :request_date
      t.decimal :cash
      t.decimal :paid
      t.decimal :remained
      t.decimal :lft_sp
      t.decimal :lft_cl
      t.decimal :lft_ax
      t.decimal :rght_sp
      t.decimal :rght_cl
      t.decimal :rght_ax
      t.string :doctor
      t.string :req_store
      t.string :deliv_store
      t.text :comment

      t.timestamps
    end
  end
end
