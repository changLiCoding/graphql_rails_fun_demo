class AddGameRefToGameGenres < ActiveRecord::Migration[6.1]
  def change
    add_reference :game_genres, :game, null: false, foreign_key: true
  end
end
