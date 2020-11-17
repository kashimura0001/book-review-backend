class CreateUserOperation < ApplicationOperation
  attr_reader :user

  def initialize(uid:, name:, email:)
    @contract = CreateUserContract.new(uid: uid, name: name, email: email)
  end

  def call
    unless valid?
      @error = ERROR_CONTRACT_VALIDATION
      return false
    end

    user = User.create!(
      uuid: @contract.uid,
      name: @contract.name,
      email: @contract.email
    )
    @user = user

    true
  end
end
