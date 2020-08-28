# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.first_name }
    surname { Faker::Name.last_name }
    email { Faker::Internet.email(name) }
    password { 'password' }
    password_confirmation { 'password' }
    confirmed_at { Time.now }
  end
end
