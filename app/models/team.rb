# frozen_string_literal: true

class Team < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
end
