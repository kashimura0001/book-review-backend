module Types
  class QueryType < Types::BaseObject
    field :current_user, Types::UserType, null: false
    def current_user
      context[:current_user]
    end
  end
end
