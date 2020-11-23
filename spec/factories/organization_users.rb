# frozen_string_literal: true

FactoryBot.define do
  factory :organization_user do
    organization { nil }
    user { nil }
    organization_role { nil }
  end
end
