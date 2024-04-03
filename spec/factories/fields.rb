FactoryBot.define do
  factory :field do
    form
    kind { %w[text string].sample }
    label { Faker::Lorem.word }
  end
end
