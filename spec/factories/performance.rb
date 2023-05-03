# frozen_string_literal: true

FactoryBot.define do
  factory :performance do
    name { Faker::Alphanumeric.alphanumeric(number: 5) }
    date_range do
      (Faker::Date.between(from: '2014-09-17', to: '2014-09-20')..
       Faker::Date.between(from: '2014-09-21', to: '2014-09-25'))
    end
  end
end
