# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: true
    field :name, String, null: true
    field :city, String, null: true
    field :country, String, null: true
    field :postcode, String, null: true
    field :posts, [Types::PostType], null: true
    field :posts_count, Integer, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :user_by_id, Types::UserType, null: true do
      argument :id, ID, required: true
    end

    field :user_by_name, Types::UserType, null: true do
      argument :name, String, required: true
    end

    def user_by_name(name)
      User.find_by(name: name)
    end

    field :users_by_country, [Types::UserType], null: false do
      argument :country, String, required: true
    end

    def user_by_id(id:)
      User.find(id)
    end

    def users_by_country(country:)
      User.where(country: country)
    end

    def posts_count
      object.posts.size
    end

  end
end
