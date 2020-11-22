# frozen_string_literal: true

module GraphqlError
  class ExecutionError < ::GraphQL::ExecutionError
    def initialize(message: self.class.const_get(:DEFAULT_MESSAGE), code: self.class.const_get(:CODE), **extensions)
      super(message, extensions: { code: code }.merge(extensions))
    end
  end

  class BadRequest < ExecutionError
    CODE = "BAD_REQUEST"
    DEFAULT_MESSAGE = "There are invalid parameters"
  end

  class NotFound < ExecutionError
    CODE = "NOT_FOUND"
    DEFAULT_MESSAGE = "The specified resource is not found"
  end

  class NotAuthorized < ExecutionError
    CODE = "NOT_AUTHORIZED"
    DEFAULT_MESSAGE = "Operation not authorized"
  end
end
