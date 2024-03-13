FactoryBot.define do
  factory :resturant do
    name { Faker::Restaurant.name }
    from { rand(10..12) }
    to { rand(21..23) }
    max_allow_duration { 2 }
  end
end
