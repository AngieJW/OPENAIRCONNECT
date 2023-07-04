class ChangeColumnDurationFromHike < ActiveRecord::Migration[7.0]
  def change
    remove_column :hikes, :duration
    add_column :hikes, :duration, :integer
  end
end
