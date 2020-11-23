# frozen_string_literal: true

class Organization < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
end
