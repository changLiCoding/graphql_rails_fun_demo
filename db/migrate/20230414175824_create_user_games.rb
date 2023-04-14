class CreateUserGames < ActiveRecord::Migration[6.1]
  def change
    create_table :user_games do |t|
      t.references :user, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true
      t.boolean :private
      t.string :review
      t.integer :rating
      t.string :game_note
      t.date :start_date
      t.date :completed_date
      t.string :game_status

      t.timestamps
    end
  end
end
