class CreateHinanjyos < ActiveRecord::Migration[5.2]
  def change
    create_table :hinanjyos do |t|
      t.string :prefecture
      t.string :place_name
      t.string :street
      t.boolean :floods
      t.boolean :mudslides
      t.boolean :high_tides
      t.boolean :earthquakes
      t.boolean :tsunami
      t.boolean :fire
      t.boolean :burst_pipe
      t.boolean :volcano
      t.float :latitude
      t.float :longtitude

      t.timestamps
    end
  end
end
