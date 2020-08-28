# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'articles has defined states' do
    let(:article) { create(:article, aasm_state: 'draft') }

    it 'can pass from draft to published' do
      article.publish_post
      expect(article.aasm_state).to eq('published')
    end

    it 'can pass from published to draft' do
      article.publish_post
      article.save_draft
      expect(article.aasm_state).to eq('draft')
    end
  end
end
