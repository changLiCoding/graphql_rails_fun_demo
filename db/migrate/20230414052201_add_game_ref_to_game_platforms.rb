class AddGameRefToGamePlatforms < ActiveRecord::Migration[6.1]
  def change
    add_reference :game_platforms, :game, null: false, foreign_key: true
  end
end
