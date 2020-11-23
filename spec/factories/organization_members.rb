FactoryBot.define do
  factory :organization_member do
    organization { nil }
    user { nil }
    role { 1 }
    invite_code { "MyString" }
    invite_email { "MyString" }
    invite_status { 1 }
    invite_at { "2020-11-23 20:49:01" }
  end
end
