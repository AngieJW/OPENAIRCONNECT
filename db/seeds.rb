Booking.destroy_all
puts 'bookings delete'

ItemBring.destroy_all
puts 'Item-brings delete'

Item.destroy_all
puts 'Items delete'

Event.destroy_all
puts 'events delete'

Chatroom.destroy_all
puts 'chatroom delete'

User.destroy_all
puts 'users delete'

Hike.destroy_all
puts 'hikes delete'

tereva = User.create!(email: 'terevamillet@yahoo.fr',
                     password: 'tereva',
                     first_name: 'Tereva',
                     last_name: 'Millet',
                     phone_number: '0618729771')
adrien = User.create!(email: 'adrienledoussal@gmail.com',
                     password: 'tereva',
                     first_name: 'Adrien',
                     last_name: 'Doussal',
                     phone_number: '0613729271')
angie = User.create!(email: 'angieduhard@gmail.com',
                    password: 'tereva',
                    first_name: 'Angie',
                    last_name: 'Duhard',
                    phone_number: '0618729271')
clara = User.create!(email: 'claraholms@gmail.com',
                    password: 'tereva',
                    first_name: 'Clara',
                    last_name: 'Holms',
                    phone_number: '0618729271')
users = [tereva, adrien, angie, clara]
puts 'Users created'


strava = [3111329327680250312, 3111329866812508050, 3111330269123832722, 3111330553428303762, 3111330629832325210, 3111331295633258386]

rand(15..20).times do
  new_date = Date.today + rand(3..10)
  groupsize = rand(5..15)
  owner = users.sample
  difficultylist = ['Facile', 'Balade', 'Intermédiaire', 'Difficile', 'Sportif']

  new_hike = Hike.create_from_strava(strava.sample)
  location = new_hike.title.split(':', 2)[0]
  new_event = Event.create!(meeting_date: new_date,
                           meeting_time: Time.new(new_date.year, new_date.month, new_date.day, rand(5..12), rand(1..59), rand(1..59)),
                           location: location,
                           group_size: groupsize,
                           difficulty: difficultylist.sample,
                           user: owner,
                           hike: new_hike)
  new_event.save!
  Chatroom.create!(event: new_event)
  items = ['tente', 'chips', 'couverture', 'pain', 'fruits', 'chocolat', 'red bull x monster de la mort qui tue goût piment']
  items.each do |item|
    Item.create(name: item, quantity: (groupsize / 4) + rand(1..3), event: new_event)
  end
  rand(0..1).times do
    Booking.create(user: users.reject { |x| x == owner }.sample, event: new_event)
  end
end

puts 'finished - hikes + events + lists items + chatroomd + bookings created'
