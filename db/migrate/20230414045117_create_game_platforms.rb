class CreateGamePlatforms < ActiveRecord::Migration[6.1]
  def change
    create_table :game_platforms do |t|
      t.string :name

      t.timestamps
    end
  end
end
