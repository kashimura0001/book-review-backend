# frozen_string_literal: true

module Types
  class QueryType < ObjectTypes::BaseObject
    field :current_user, ObjectTypes::UserType, null: true
    def current_user
      context[:current_user]
    end
  end
end
