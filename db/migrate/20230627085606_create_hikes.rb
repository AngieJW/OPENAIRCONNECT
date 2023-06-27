class CreateHikes < ActiveRecord::Migration[7.0]
  def change
    create_table :hikes do |t|
      t.float :distance
      t.integer :elevation
      t.time :duration
      t.float :starting_lat
      t.float :starting_long
      t.float :ending_lat
      t.float :ending_long

      t.timestamps
    end
  end
end
