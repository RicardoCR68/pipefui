FactoryBot.define do
  factory :answer_field do
    answer
    field { build(:field, form: answer.form) }
    string_body { field.kind == 'string' ? Faker::Lorem.sentence : nil }
    text_body { field.kind == 'text' ? Faker::Lorem.paragraph : nil }
  end

  trait :with_string_kind do
    field { build(:field, kind: 'string', form: answer.form) }
    string_body { Faker::Lorem.sentence }
  end

  trait :with_text_kind do
    field { build(:field, kind: 'text', form: answer.form) }
    text_body { Faker::Lorem.paragraph }
  end
end
