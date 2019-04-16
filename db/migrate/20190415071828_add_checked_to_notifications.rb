class AddCheckedToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :checked, :boolean, default: false
  end
end
