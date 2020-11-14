module Mutations
  class SignUp < BaseMutation

    argument :token, String, required: true
    argument :name, String, required: true
    argument :email, String, required: true

    field :user, Types::UserType, null: false

    def resolve(token: nil, name: nil, email: nil)
      decoded_token = FirebaseHelper::Auth.verify_id_token(token)
      user = User.create!(
        uuid: decoded_token[:uid],
        name: name,
        email: email
      )

      { user: user }
    end
  end
end
