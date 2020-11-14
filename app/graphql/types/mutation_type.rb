module Types
  class MutationType < Types::BaseObject
    field :sign_up, mutation: Mutations::SignUp
    field :delete_user, mutation: Mutations::DeleteUser
    field :sign_in_user, mutation: Mutations::SignInUser
  end
end
