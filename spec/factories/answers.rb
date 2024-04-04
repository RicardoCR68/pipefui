FactoryBot.define do
  factory :answer do
    form
    email { Faker::Internet.email }
  end
end
