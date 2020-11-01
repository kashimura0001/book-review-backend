module Types
  class QueryType < Types::BaseObject
    field :user, Types::UserType, null: false
    def user
      context[:current_user]
    end
  end
end
