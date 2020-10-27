module Mutations
  class CreateUser < BaseMutation

    argument :name, String, required: true
    argument :email, String, required: true

    field :user, Types::UserType, null: false

    def resolve(name: nil, email: nil)
      user = User.create!(
        uuid: context[:decoded_token]['uid'],
        name: name,
        email: email
      )

      { user: user }
    end
  end
end
