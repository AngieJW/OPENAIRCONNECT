class AddPackedToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :packed, :boolean
  end
end
