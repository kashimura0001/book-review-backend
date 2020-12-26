# frozen_string_literal: true

module ObjectTypes
  class BaseObject < GraphQL::Schema::Object
    field_class FieldTypes::BaseField
  end
end
