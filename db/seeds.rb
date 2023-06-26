# Event.create(meeting_date: , meeting_time:  , meeting_point:  , group_size:  )
# Booking.create(User.first, Event.first)

require 'faker'

User.delete_all
puts 'users delete'
Event.delete_all
puts 'events delete'

# has_many :events
# has_many :events_users

# validates :first_name, presence: true
# validates :last_name, presence: true
# validates :phone_number, presence: true
# validates :password, presence: true

Faker::Config.locale = 'fr-CA'

5.times do
  new_first_name = Faker::Name.first_name
  new_last_name = Faker::Name.last_name
  new_user = User.create(email: "#{new_first_name}.#{new_last_name}@gmail.fr",
                         password: 'mdp123456',
                         first_name: new_first_name,
                         last_name: new_last_name,
                         phone_number: Faker::PhoneNumber.phone_number)
  # new_event = Event.create()
end

puts 'users created'
