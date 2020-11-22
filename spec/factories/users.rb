# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    firebase_uid { "MyString" }
    name { "MyString" }
    email { "MyString" }
    avatar_url { "MyString" }
  end
end
