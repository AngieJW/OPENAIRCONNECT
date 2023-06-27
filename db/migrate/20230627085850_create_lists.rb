class CreateLists < ActiveRecord::Migration[7.0]
  def change
    create_table :lists do |t|
      t.string :item
      t.integer :quantity
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
