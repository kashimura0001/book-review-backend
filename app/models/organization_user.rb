# frozen_string_literal: true

class OrganizationUser < ApplicationRecord
  belongs_to :organization
  belongs_to :user
  belongs_to :organization_role
end
