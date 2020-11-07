users = User.all
places = Place.all

7.times do
  user = User.new(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      password: "lewagon",
  )
  avatar = ""
  avatar_path = Rails.root.join('app','assets','images','profile_pics')
  filename = Dir.children(avatar_path).sample
  avatar = avatar_path + filename
  user.photo.attach(io: File.open(avatar), filename: filename)
  user.save!
  puts "User '#{user.first_name} #{user.last_name}' Created"
end

$adjetivos = ["aconchegante", "lindo", "luxuoso", "confortavel", "inteiro", "reformado", "fantastico", "amplo", "moderno", "ensolarado"]
$location_types = ["Studio", "Apartamento", "Duplex", "Loft"]

def airbnb_name_generator(address, location)
  return "#{location} #{$adjetivos.sample} na #{address}"
end

users.each do |user|
    4.times do
        location = $location_types.sample
        address = Faker::Address.street_name
        place = Place.new(
            location: address,
            price_per_day: rand(50..1000),
            name: airbnb_name_generator(address, location),
            location_type: location,
            user_id: user.id
        )
        image = ""
        image_path = Rails.root.join('app','assets','images','location_pics')
        filename = Dir.children(image_path).sample
        image = image_path + filename
        place.image.attach(io: File.open(image), filename: filename)
        place.save!
        puts "Place '#{place.name}' Created"
    end
end

Place.all.each do |place|
  4.times do
    review = Review.new(
        user_rating: rand(1..5),
        place_rating: rand(1..5),
        comments: Faker::Lorem.sentence(word_count: rand(5..15)),
      )
    review.place = place
    review.user = users.sample
    review.save!
    puts("Creating review for #{place.name} by #{review.user.first_name}")
  end
end
