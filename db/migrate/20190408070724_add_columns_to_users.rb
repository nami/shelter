class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :sei, :string
    add_column :users, :mei, :string
    add_column :users, :sei_kana, :string
    add_column :users, :mei_kana, :string
    add_column :users, :role, :string
    add_column :users, :phone, :string
    add_column :users, :address, :string
    add_column :users, :verified, :boolean
    add_column :users, :photo_id, :string
    add_column :users, :avatar, :string
  end
end
