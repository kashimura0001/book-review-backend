# frozen_string_literal: true

class OrganizationRole < ApplicationRecord
  validates :role, presence: true, uniqueness: true, length: { maximum: 100 }
end
