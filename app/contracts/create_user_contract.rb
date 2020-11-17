class CreateUserContract < ApplicationContract
  attribute :uid
  attribute :name
  attribute :email

  validates :uid, presence: true
  validates :name, presence: true
  validates :email, presence: true
end
