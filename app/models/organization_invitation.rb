# frozen_string_literal: true

class OrganizationInvitation < ApplicationRecord
  belongs_to :organization
  belongs_to :organization_role

  validates :invite_code, presence: true, uniqueness: true, length: { maximum: 255 }
  validates :email, presence: true, length: { maximum: 255 }
  validates :status, presence: true
  validates :invited_at, presence: true
end
