class AddColumnToHikes < ActiveRecord::Migration[7.0]
  def change
    add_column :hikes, :title, :string
  end
end
