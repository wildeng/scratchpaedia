# frozen_string_literal: true

FactoryBot.define do
  factory :article do
    title { Faker::Book.title }
    content { Faker::Book.publisher }
    user_id { create(:user).id }
    aasm_state { %w[published draft].sample }
  end
end
