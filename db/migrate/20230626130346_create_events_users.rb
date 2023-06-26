class CreateEventsUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :events_users do |t|
      t.references :users, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.references :memory, null: false, foreign_key: true
      t.references :chatroom, null: false, foreign_key: true

      t.timestamps
    end
  end
end
