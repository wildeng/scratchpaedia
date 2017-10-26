FactoryBot.define do
  factory :article do
    title { Faker::Book.title }
    content { Faker::Matz.quote }
    user_id { create(:user).id }
    aasm_state { %w[published draft].sample }
  end
end
