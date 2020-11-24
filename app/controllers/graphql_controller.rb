# frozen_string_literal: true

class GraphqlController < ApplicationController

  def execute
    variables = ensure_hash(params[:variables])
    query = params[:query]
    operation_name = params[:operationName]
    context = { current_user: auth_free?(query) ? nil : current_user }
    result = BukureBackendSchema.execute(query, variables: variables, context: context, operation_name: operation_name)
    render json: result
  rescue StandardError => e
    raise e unless Rails.env.development?
    handle_error_in_development e
  end

  private

  def ensure_hash(ambiguous_param)
    case ambiguous_param
    when String
      if ambiguous_param.present?
        ensure_hash(JSON.parse(ambiguous_param))
      else
        {}
      end
    when Hash, ActionController::Parameters
      ambiguous_param
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
    end
  end

  def auth_free?(query)
    if query.blank?
      raise GraphQL::ParseError.new("GraphQL document must have one or more definitions", nil, nil, query)
    end

    parsed_query = GraphQL.parse(query)
    operations = parsed_query.definitions.select { |q| q.is_a?(GraphQL::Language::Nodes::OperationDefinition) }

    auth_free_operation_names = %w[
      createUser
    ]

    operations.each do |operation|
      return true if operation.selections.find { |o| auth_free_operation_names.include?(o.name) }
    end

    false
  end

  # Authentication
  def current_user
    raise "Authorization token is empty" if request.headers["Authorization"].blank?

    token = request.headers["Authorization"].split(" ").last
    decoded_token = FirebaseHelper::Auth.verify_id_token(token)
    decoded_token ? User.with_firebase_uid(decoded_token[:uid]) : nil
  end

  def handle_error_in_development(e)
    logger.error e.message
    logger.error e.backtrace.join("\n")

    render json: { error: { message: e.message, backtrace: e.backtrace }, data: {} }, status: 500
  end
end
