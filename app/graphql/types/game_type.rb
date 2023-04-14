module Types
  class GameType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :description, String, null: false
    field :imageURL, String, null: false
    field :releaseDate, GraphQL::Types::ISO8601DateTime, null: false
    field :avg_score, Integer, null: false
    field :total_rating, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end

end
