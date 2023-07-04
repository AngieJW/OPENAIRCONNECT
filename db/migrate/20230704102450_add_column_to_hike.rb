class AddColumnToHike < ActiveRecord::Migration[7.0]
  def change
    add_column :hikes, :image_url, :string
  end
end
