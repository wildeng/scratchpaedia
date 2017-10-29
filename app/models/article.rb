# model for articles
class Article < ApplicationRecord
  include AASM
  # setting up postgres full text search
  include PgSearch
  pg_search_scope :search_by_full_text,\
                  against: %i[title content],\
                  associated_against: { tags: :name }

  acts_as_taggable

  # setting up basic state machine
  aasm do
    state :published, initial: true
    state :draft

    event :publish_post do
      transitions from: :published, to: :published
      transitions from: :draft, to: :published
    end

    event :save_draft do
      transitions from: :published, to: :draft
      transitions from: :draft, to: :draft
    end
  end

  belongs_to :user

  scope :published_posts, -> { where(aasm_state: 'published') }
  scope :draft_posts, -> { where(aasm_state: 'draft') }
end
