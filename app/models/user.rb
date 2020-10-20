class User < ApplicationRecord
  validates :uuid, presence: true, uniqueness: true
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
