
Booking.destroy_all

ItemBring.destroy_all
puts 'Item-brings delete'

Item.destroy_all
puts 'Items delete'

Event.delete_all
puts 'events delete'

User.delete_all
puts 'users delete'


Hike.delete_all
puts 'hikes delete'


coucou = User.create(email: 'terevamillet@yahoo.fr',
                     password: 'tereva',
                     first_name: 'Tereva',
                     last_name: 'Millet',
                     phone_number: '0618729271')
jeanjean = User.create(email: 'toto@gmail.com',
                      password: 'tototo',
                      first_name: 'Tereva',
                      last_name: 'Millet',
                      phone_number: '0618729271')
lenonvoulu = User.create(email: 'titi@gmail.com',
                        password: 'tototo',
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

item = Item.create(name: "gourde", quantity: "7", event: eventu)
item2 = Item.create(name: "pain", quantity: "4", event: eventu)
item3 = Item.create(name: "tente", quantity: "3", event: eventu)

booking = Booking.create(user: coucou, event: eventu)
booking = Booking.create(user: jeanjean, event: eventu)

item_brings1 = ItemBring.create(user: coucou, event:eventu, item:item, quantity: 3)

puts 'finished'
