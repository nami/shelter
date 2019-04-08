class AddDefaultValueToDisasters < ActiveRecord::Migration[5.2]
  def change
    change_column :hinanjyos, :floods, :boolean, default: false
    change_column :hinanjyos, :mudslides, :boolean, default: false
    change_column :hinanjyos, :high_tides, :boolean, default: false
    change_column :hinanjyos, :earthquakes, :boolean, default: false
    change_column :hinanjyos,:tsunami, :boolean, default: false
    change_column :hinanjyos, :fire, :boolean, default: false
    change_column :hinanjyos, :burst_pipe, :boolean, default: false
    change_column :hinanjyos,:volcano, :boolean, default: false
  end
end
