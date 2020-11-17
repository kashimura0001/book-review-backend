class BukureBackendSchema < GraphQL::Schema
  use GraphQL::Execution::Interpreter
  use GraphQL::Analysis::AST
  use GraphQL::Execution::Errors

  rescue_from(ActiveRecord::RecordInvalid) do |error, _obj, _args, _ctx, _field|
    GraphqlError::BadRequest.new(message: error.message)
  end

  rescue_from(ActiveRecord::RecordNotFound) do |error, _obj, _args, _ctx, _field|
    GraphqlError::NotFound.new(message: error.message)
  end

  rescue_from(ActiveModel::ValidationError) do |error, _obj, _args, context, _field|
    error.model.errors.keys.each do |attr|
      is_own_attr = error.model.attribute_names.include?(attr.to_s)
      messages =
        if is_own_attr
          error.model.errors.full_messages_for(attr)
        else
          # NOTE: The error messages of child contract are already converted full error message
          error.model.errors.messages[attr.to_sym]
        end

      messages.each do |message|
        context.add_error(GraphqlError::BadRequest.new(message: message, attribute: attr.to_s.camelize(:lower)))
      end
    end

    nil
  end

  mutation(Types::MutationType)
  query(Types::QueryType)
end
