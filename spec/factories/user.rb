FactoryBot.define do
  factory :user do
    name { "testuser#{[*1..1000].sample}" }
    email { "test#{[*1..1000].sample}@example.com" }
    password { 'password' }
  end
end
