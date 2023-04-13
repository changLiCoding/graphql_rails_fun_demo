class Mutations::Login < Mutations::BaseMutation
  argument :email, String, required: true
  argument :password, String, required: true

  field :token, String, null: true
  field :errors, [String], null: false

  def resolve(email:, password:)
    user = User.find_by(email: email)

    if user && user.authenticate(password)
      {
        token: user.generate_token,
        errors: []
      }
    else
      {
        token: nil,
        errors: ["Invalid email or password"]
      }
    end
  end
end
