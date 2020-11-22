# frozen_string_literal: true

FactoryBot.define do
  factory :team_user do
    team { nil }
    user { nil }
    role { 1 }
  end
end
