# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :team
  belongs_to :user
  belongs_to :book

  validates :title, presence: true, length: { maximum: 100 }
  validates :body, presence: true
end
