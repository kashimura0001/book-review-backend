class GraphqlController < ApplicationController

  def execute
    variables = ensure_hash(params[:variables])
    query = params[:query]
    operation_name = params[:operationName]
    context = { current_user: need_sign_in?(query) ? current_user : nil }
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

  def need_sign_in?(query)
    parsed_document = parse_to_document(query)
    operation_defs = parsed_document.definitions.select do |d|
      d.is_a?(GraphQL::Language::Nodes::OperationDefinition)
    end

    is_needed = false
    no_needed_operation_names = %w[
      signUp
    ]

    operation_defs.each do |operation_def|
      is_needed = true if operation_def.selections.find { |s| no_needed_operation_names.exclude?(s.name) }
    end

    is_needed
  end

  def parse_to_document(query)
    raise GraphQL::ParseError.new('GraphQL document must have one or more definitions', nil, nil, query) if query.blank?

    GraphQL.parse(query)
  end

  # Authentication
  def current_user
    raise 'Authorization token is empty' if request.headers['Authorization'].blank?

    token = request.headers['Authorization'].split(' ').last
    decoded_token = FirebaseHelper::Auth.verify_id_token(token)
    decoded_token ? User.find_by(uuid: decoded_token[:uid]) : nil
  end

  def handle_error_in_development(e)
    logger.error e.message
    logger.error e.backtrace.join("\n")

    render json: { error: { message: e.message, backtrace: e.backtrace }, data: {} }, status: 500
  end
end
