class Mutations::SignUp < Mutations::BaseMutation
  argument :name, String, required: true
  argument :email, String, required: true
  argument :password, String, required: true

  field :token, String, null: false
  field :errors, [String], null: false
  def resolve(name:, email:, password:)
    user = User.new(name: name, email: email, password: password)
    if user.save

      {
        token: user.generate_token,
        errors: [],
      }
    else
      {
        token: nil,
        errors: GraphQL::ExecutionError.new("Register failed."),
      }
    end
  end
end
