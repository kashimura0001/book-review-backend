FactoryBot.define do
  factory :review do
    team { nil }
    user { nil }
    book { nil }
    title { "MyString" }
    body { "MyText" }
  end
end
