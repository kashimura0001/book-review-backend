# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    team { nil }
    isbn { "MyString" }
    title { "MyString" }
    author { "MyString" }
    image_url { "MyString" }
  end
end
