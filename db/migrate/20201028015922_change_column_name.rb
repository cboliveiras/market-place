class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :places, :type, :location_type
  end
end
