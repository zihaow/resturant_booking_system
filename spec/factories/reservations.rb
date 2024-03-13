FactoryBot.define do
  factory :reservation do
    party_size { Faker::Number.between(from: 1, to: 4) }
  end
end
