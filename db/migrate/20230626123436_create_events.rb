class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.date :meeting_date
      t.time :meeting_time
      t.string :meeting_point
      t.integer :group_size
      t.boolean :swim
      t.boolean :break
      t.string :difficulty
      t.text :description
      t.references :hike, null: false, foreign_key: true

      t.timestamps
    end
  end
end
