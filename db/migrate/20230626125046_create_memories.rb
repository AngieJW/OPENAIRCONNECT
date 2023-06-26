class CreateMemories < ActiveRecord::Migration[7.0]
  def change
    create_table :memories do |t|
      t.string :pictures
      t.string :comments

      t.timestamps
    end
  end
end
