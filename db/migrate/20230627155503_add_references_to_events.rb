class AddReferencesToEvents < ActiveRecord::Migration[7.0]
  def change
    add_reference :events, :memory, null: true, foreign_key: true
  end
end
