# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
100.times do
  game = Game.create(name: Faker::Game.title, description: Faker::Lorem.paragraph(sentence_count: 2), imageURL: Faker::LoremFlickr.image(size: "300x300", search_terms: ['game']), releaseDate: Faker::Date.between(from: '2014-09-23', to: '2021-09-25'), avg_score: Faker::Number.between(from: 1, to: 5), total_ratings: Faker::Number.between(from: 1, to: 1000))

  2.times do
    game_platform = GamePlatform.create(name: Faker::Game.platform)
    game.game_platforms << game_platform

    puts "Created game with name #{game.name} and game_platform #{game_platform.name}"

    game_genre = GameGenre.create(name: Faker::Game.genre)
    game.game_genres << game_genre

    puts "Created game with name #{game.name} and game_genre #{game_genre.name}"
  end

end


100.times do
  user = User.create(name: Faker::Name.name, email: Faker::Internet.email, password: "password", city: Faker::Address.city, country: Faker::Address.country, postcode: Faker::Address.postcode)
  5.times do
    post = user.posts.create(title: Faker::Lorem.sentence(word_count: 3), body: Faker::Lorem::paragraph(sentence_count: 5))
    5.times do
      post.comments.create(body: Faker::Lorem::paragraph(sentence_count: 2), user_id: User.all.sample.id)
    end
  end
end

user = User.create(name: "Greta Thunberg", email: "gretat@gmail.com", city: "Stockholm", country: "Sweden", postcode: "12345", password: "password")
user.posts.create(title: "Climate Change", body: "Climate change is the biggest threat to our planet. We need to act now!")
