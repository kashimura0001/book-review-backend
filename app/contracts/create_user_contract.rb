# frozen_string_literal: true

class CreateUserContract < ApplicationContract
  attribute :firebase_uid
  attribute :name
  attribute :email

  validates :firebase_uid, presence: true
  validates :name, presence: true
  validates :email, presence: true
end
