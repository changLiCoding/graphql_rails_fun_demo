module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :create_post, mutation: Mutations::CreatePost
    field :sign_up, mutation: Mutations::SignUp
    field :login, mutation: Mutations::Login
  end
end
