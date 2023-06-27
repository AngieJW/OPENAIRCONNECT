class CreateMemories < ActiveRecord::Migration[7.0]
  def change
    create_table :memories do |t|
      t.string :picture
      t.text :comment

      t.timestamps
    end
  end
end
