FactoryBot.define do
  factory :field do
    form
    kind { %w[text string].sample }
    label { Faker::Lorem.question }
  end
end
