require "faker"

User.destroy_all
Hotel.destroy_all
Room.destroy_all


users = User.create([
  { email: 'user1@example.com', password: 'password' },
  { email: 'user2@example.com', password: 'password' }
])

# Création d'hôtels
hotels = Hotel.create([
  { name: 'Hôtel 1', address: 'Adresse 1' },
  { name: 'Hôtel 2', address: 'Adresse 2' }
])


hotels.each do |hotel|
  5.times do |i|
    hotel.rooms.create(
      price_per_night: rand(50..200),
      capacity: rand(1..4)
    )
  end
end


# Création de réservations pour chaque utilisateur
users.each do |user|
  3.times do |i|
    room = Room.all.sample
    user.bookings.create(
      room: room,
      starts_at: Faker::Date.between(from: 1.month.ago, to: Date.today),
      ends_date: Faker::Date.between(from: Date.today, to: 1.month.from_now)
    )
  end
end
