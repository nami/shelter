class AddDefaultValueToVerified < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :verified, :boolean, default: false
  end
end
