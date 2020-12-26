# frozen_string_literal: true

module ObjectTypes
  class UserType < ObjectTypes::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :email, String, null: false
  end
end
