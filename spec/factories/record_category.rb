FactoryBot.define do
  factory :record_category do
    title { 'test_category' }
    association :icon
    association :pet
  end
end
