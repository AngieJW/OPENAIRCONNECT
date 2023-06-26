class CreateHikes < ActiveRecord::Migration[7.0]
  def change
    create_table :hikes do |t|
      t.integer :distance
      t.integer :elevation
      t.time :duration
      t.integer :starting_lat
      t.integer :starting_lng
      t.integer :ending_lat
      t.integer :ending_lng

      t.timestamps
    end
  end
end
