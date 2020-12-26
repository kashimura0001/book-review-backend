# frozen_string_literal: true

module FieldTypes
  class BaseField < GraphQL::Schema::Field
    argument_class ArgumentTypes::BaseArgument
  end
end
