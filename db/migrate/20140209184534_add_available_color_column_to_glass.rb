class AddAvailableColorColumnToGlass < ActiveRecord::Migration
  def change
    add_column :glasses, :available_color, :string
  end
end
