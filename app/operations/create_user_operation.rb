# frozen_string_literal: true

class CreateUserOperation < ApplicationOperation
  attr_reader :user

  def initialize(firebase_uid:, name:, email:)
    @contract = CreateUserContract.new(firebase_uid: firebase_uid, name: name, email: email)
  end

  def call
    unless valid?
      @error = ERROR_CONTRACT_VALIDATION
      return false
    end

    user = User.create!(
      firebase_uid: @contract.firebase_uid,
      name: @contract.name,
      email: @contract.email
    )
    @user = user

    true
  end
end
