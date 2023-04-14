class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :imageURL
      t.date :releaseDate
      t.integer :avg_score
      t.integer :total_rating

      t.timestamps
    end
  end
end
