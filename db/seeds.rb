# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
1000.times do
  user = User.create(name: Faker::Name.name, email: Faker::Internet.email, city: Faker::Address.city, country: Faker::Address.country, postcode: Faker::Address.postcode)
  5.times do
    post = user.posts.create(title: Faker::Lorem.sentence(word_count: 3), body: Faker::Lorem::paragraph(sentence_count: 5))
    5.times do
      post.comments.create(body: Faker::Lorem::paragraph(sentence_count: 2), user_id: User.all.sample.id)
    end
  end
end

user = User.create(name: "Greta Thunberg", email: "gretat@gmail.com", city: "Stockholm", country: "Sweden", postcode: "12345")
user.posts.create(title: "Climate Change", body: "Climate change is the biggest threat to our planet. We need to act now!")
