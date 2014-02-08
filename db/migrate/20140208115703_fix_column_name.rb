class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :glasses, :type, :glass_kind
  end
end
