# frozen_string_literal: true

FactoryBot.define do
  factory :organization_invitation do
    organization { nil }
    organization_role { nil }
    invite_code { "MyString" }
    email { "MyString" }
    status { 1 }
    invited_at { "2020-11-23 15:46:04" }
  end
end
