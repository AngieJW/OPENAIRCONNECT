class CreateItemBrings < ActiveRecord::Migration[7.0]
  def change
    create_table :item_brings do |t|
      t.references :event, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
