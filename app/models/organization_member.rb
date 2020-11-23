# frozen_string_literal: true

class OrganizationMember < ApplicationRecord
  belongs_to :organization
  belongs_to :user
end
