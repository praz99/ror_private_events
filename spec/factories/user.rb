FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "kiki#{n}" }
    sequence(:username) { |n| "kikiolla#{n}" }
  end
end