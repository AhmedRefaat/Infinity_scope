class AddSoldColumnToGlassTable < ActiveRecord::Migration
  def change
    add_column :glasses, :sold, :integer
  end
end
