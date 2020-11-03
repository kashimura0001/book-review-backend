module Mutations
  class SignInUser < BaseMutation

    field :user, Types::UserType, null: true

    def resolve
      { user: context[:current_user] }
    end
  end
end
