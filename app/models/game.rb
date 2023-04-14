class Game < ApplicationRecord
  has_many :game_platforms
  has_many :game_genres
end
