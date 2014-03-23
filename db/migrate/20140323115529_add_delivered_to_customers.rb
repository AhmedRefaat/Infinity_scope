class AddDeliveredToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :delivered, :boolean
  end
end
