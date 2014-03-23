class AddFrameMaterialColumnToGlasses < ActiveRecord::Migration
  def change
    add_column :glasses, :frame_material, :string
  end
end
