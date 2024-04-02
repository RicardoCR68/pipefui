# frozen_string_literal: true

FactoryBot.define do
  factory :form do
    title { Faker::Lorem.question }
  end
end
