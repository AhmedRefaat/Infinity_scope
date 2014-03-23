class AddNumberOfGlassesToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :number_of_glasses, :integer
  end
end
