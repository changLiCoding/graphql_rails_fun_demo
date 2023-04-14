class Game < ApplicationRecord
  has_many :game_platforms
  has_many :game_genres
  has_many :user_games
  has_many :users, through: :user_gamesend
end
