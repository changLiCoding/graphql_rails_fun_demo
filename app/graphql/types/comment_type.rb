# frozen_string_literal: true

module Types
  class CommentType < Types::BaseObject


    field :id, ID, null: false
    field :body, String, null: true
    field :user_id, Integer, null: false
    field :user, Types::UserType
    field :post_id, Integer, null: false
    field :post, Types::PostType

    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false


  end
end
