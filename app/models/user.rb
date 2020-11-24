# frozen_string_literal: true

class User < ApplicationRecord
  validates :firebase_uid, presence: true, uniqueness: true, length: { maximum: 255 }
  validates :name, presence: true, length: { maximum: 100 }
  validates :email, presence: true, uniqueness: true, length: { maximum: 255 }
  validates :avatar_url, length: { maximum: 255 }

  scope :with_firebase_uid, ->(firebase_uid) { find_by(firebase_uid: firebase_uid) }
end
