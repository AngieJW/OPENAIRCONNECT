User.delete_all
puts 'users delete'
Event.delete_all
puts 'events delete'
Hike.delete_all
puts 'hikes delete'

coucou = User.create(email: 'terevamillet@yahoo.fr',
                     password: 'tereva',
                     first_name: 'Tereva',
                     last_name: 'Millet',
                     phone_number: '0618729271')
new_hike = Hike.create(distance: 304,
                       elevation: 120,
                       duration: Time.new,
                       starting_lat: 3.112,
                       starting_long: 4.41,
                       ending_lat: 1312,
                       ending_long: 121)
eventu = Event.create(meeting_date: Date.new,
                      meeting_time: Time.new,
                      meeting_point: '21 Rue Haxo',
                      group_size: rand(5..10),
                      user: coucou)
eventu.hike = new_hike
eventu.save!

puts 'finished'
