FactoryBot.define do
  factory :content do
    have_on { Date.today }
    association :pet
  end
end
