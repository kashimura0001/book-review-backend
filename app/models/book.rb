# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :organization

  validates :isbn, uniqueness: true, length: { maximum: 50 }
  validates :title, presence: true, length: { maximum: 255 }
  validates :author, presence: true, length: { maximum: 255 }
  validates :image_url, presence: true, length: { maximum: 255 }
end
