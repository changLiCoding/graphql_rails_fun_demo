module Types
  class QueryType < Types::BaseObject
    # # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    # include GraphQL::Types::Relay::HasNodeField
    # include GraphQL::Types::Relay::HasNodesField

    # games
    field :games, [Types::GameType], null: false

    def games
      Game.all
    end

    # users
    # field :users, [Types::UserType], null: false
    field :users, [Types::UserType], null: false do
      description "Returns a list of all users"
    end
    def users
      User.all
    end

    field :user_by_id, Types::UserType, null: false do
      argument :id, ID, required: true
    end

    def user_by_id(id: nil)
        User.find(id)
    end

    field :user_by_country, [Types::UserType], null: false do
      argument :country, String, required: false
    end

    def user_by_country(country: nil)
      User.where(country: country)
    end

    field :user_by_name, Types::UserType, null: true do
      argument :name, String, required: true
    end

    def user_by_name(name)
      User.find_by({name: name})
    end

    field :posts, [Types::PostType], null: false
    def posts
      Post.all
    end

    field :post, Types::PostType, null: false do
      argument :id, ID, required: true
    end

    def post(id:)
      Post.find(id)
    end


    field :comments, [Types::CommentType], null: false
    def comments
      Comment.all
    end

  end
end
