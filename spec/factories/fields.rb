FactoryBot.define do
  factory :field do
    form
    kind { %w[text string].sample }
    text_body { Faker::Lorem.paragraph if kind == 'text' }
    string_body { Faker::Lorem.sentence if kind == 'string' }
  end

  trait :text do
    kind { 'text' }
    text_body { Faker::Lorem.paragraph }
  end

  trait :string do
    kind { 'string' }
    string_body { Faker::Lorem.sentence }
  end
end
