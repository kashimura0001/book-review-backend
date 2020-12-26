# frozen_string_literal: true

module InputTypes
  class BaseInputObject < GraphQL::Schema::InputObject
    argument_class ArgumentTypes::BaseArgument
  end
end
