class User < ApplicationRecord
  validates :firebase_uid, presence: true, uniqueness: true
  validates :name, presence: true
  validates :email, presence: true
end
