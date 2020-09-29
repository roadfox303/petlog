FactoryBot.define do
  factory :pet do
    name { 'testpet' }
    intrust { false }
    association :owner, factory: :user
  end
end
