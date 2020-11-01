module Mutations
  class SignIn < BaseMutation

    argument :email, String, required: true

    field :user, Types::UserType, null: false

    def resolve(email: nil)
      if context[:current_user].blank?
        user = User.create!(
          uuid: context[:decoded_token][:uid],
          name: SecureRandom.hex(8),
          email: email
        )

        return { user: user }
      end

      { user: context[:current_user] }
    end
  end
end
