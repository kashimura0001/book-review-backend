# frozen_string_literal: true

FactoryBot.define do
  factory :review do
    organization { nil }
    user { nil }
    book { nil }
    title { "MyString" }
    body { "MyText" }
  end
end
