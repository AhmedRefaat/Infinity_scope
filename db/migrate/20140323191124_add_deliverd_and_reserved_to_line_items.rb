class AddDeliverdAndReservedToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :delivered, :boolean
    add_column :line_items, :reserved, :boolean
  end
end
