# Event.create(meeting_date: , meeting_time:  , meeting_point:  , group_size:  )
# Booking.create(User.first, Event.first)

require 'faker'

User.delete_all
puts 'users delete'
Event.delete_all
puts 'events delete'

# validates :meeting_date, presence: true
# validates :meeting_time, presence: true
# validates :meeting_point, presence: true
# validates :group_size, presence: true

Faker::Config.locale = 'fr-CA'

5.times do
  new_first_name = Faker::Name.first_name
  new_last_name = Faker::Name.last_name
  new_user = User.create(email: "#{new_first_name}.#{new_last_name}@gmail.fr",
                         password: 'mdp123456',
                         first_name: new_first_name,
                         last_name: new_last_name,
                         phone_number: Faker::PhoneNumber.phone_number)
  new_hike = Hike.create(distance: 304,
                         elevation: 120,
                         duration: Time.new,
                         starting_lat: 3.112,
                         starting_lng: 4.41,
                         ending_lat: 1312,
                         ending_lng: 121)
  # new_event = Event.create(meeting_date: Date.new,
  #                          meeting_time: Time.new,
  #                          meeting_point: '21 Rue Haxo',
  #                          group_size: rand(5..10))
end

puts 'finished'
