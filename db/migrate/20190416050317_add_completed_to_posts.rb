class AddCompletedToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :completed, :boolean, default: false
  end
end
