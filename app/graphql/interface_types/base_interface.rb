# frozen_string_literal: true

module InterfaceTypes
  module BaseInterface
    include GraphQL::Schema::Interface

    field_class FieldTypes::BaseField
  end
end
