5.times do
    User.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        password: "lewagon"
    )    
end

users = User.all

location_types = ["house", "apartment"]
users.each do |user|
    10.times do
        Place.create(
            location: Faker::Games::Pokemon.location,
            price_per_day: rand(50..100),
            name: Faker::Games::SuperSmashBros.stage,
            location_type: location_types.sample, 
            user_id: user.id
        )
    end
end