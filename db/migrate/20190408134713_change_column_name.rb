class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :hinanjyos, :longtitude, :longitude
  end
end
