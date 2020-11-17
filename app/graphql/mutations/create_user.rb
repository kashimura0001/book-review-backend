module Mutations
  class CreateUser < BaseMutation

    argument :token, String, required: true
    argument :name, String, required: true
    argument :email, String, required: true

    field :user, Types::UserType, null: false

    def resolve(token:, name:, email:)
      decoded_token = FirebaseHelper::Auth.verify_id_token(token)
      operation = CreateUserOperation.new(uid: decoded_token[:uid], name: name, email: email)

      return { user: operation.user } if operation.call

      raise ActiveRecord::ValidationError if operation.error.present?

      raise "Unexpected operation error. error: #{operation.error}"
    end
  end
end
