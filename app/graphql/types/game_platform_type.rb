module Types
  class GamePlatformType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :game_id, Integer, null: false
    field :game, Types::GameType
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end

end
