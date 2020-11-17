module GraphqlError
  class ExecutionError < ::GraphQL::ExecutionError
    def initialize(message: self.class.const_get(:DEFAULT_MESSAGE), code: self.class.const_get(:CODE), **extensions)
      super(message, extensions: { code: code }.merge(extensions))
    end
  end

  class BadRequest < ExecutionError
    CODE = 'BAD_REQUEST'.freeze
    DEFAULT_MESSAGE = 'There are invalid parameters'.freeze
  end

  class NotFound < ExecutionError
    CODE = 'NOT_FOUND'.freeze
    DEFAULT_MESSAGE = 'The specified resource is not found'.freeze
  end

  class NotAuthorized < ExecutionError
    CODE = 'NOT_AUTHORIZED'.freeze
    DEFAULT_MESSAGE = 'Operation not authorized'.freeze
  end
end
