# frozen_string_literal: true

FactoryBot.define do
  factory :table do
    size { rand(4..8) }
  end
end
