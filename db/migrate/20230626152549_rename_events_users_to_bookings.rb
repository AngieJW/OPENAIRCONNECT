class RenameEventsUsersToBookings < ActiveRecord::Migration[7.0]
  def change
    rename_table :events_users, :bookings
  end
end
