class RenameTotalRatingsColumnInGames < ActiveRecord::Migration[6.1]
  def change
    rename_column :games, :total_rating, :total_ratings
  end
end
