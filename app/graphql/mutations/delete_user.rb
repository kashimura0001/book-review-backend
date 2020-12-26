# frozen_string_literal: true

module Mutations
  class DeleteUser < BaseMutation

    field :user, ObjectTypes::UserType, null: false

    def resolve
      return unless context[:current_user]

      user = context[:current_user]
      user.destroy!

      { user: user }
    end
  end
end
