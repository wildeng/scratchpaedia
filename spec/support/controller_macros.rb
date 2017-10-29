module ControllerMacros
  attr_reader :user

  def login_user
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      user = FactoryBot.create(:user)
      sign_in user
    end
  end

  def create_published_anonymous_articles
    before(:each) do
      4.times do
        FactoryBot.create(
          :article,
          aasm_state: 'published',
          tag_list: 'ruby,rails,rubocop'
        )
      end
    end
  end

  def create_draft_anonymous_articles
    before(:each) do
      4.times do
        FactoryBot.create(:article, aasm_state: 'draft')
      end
    end
  end

  def create_logged_user_draft_articles
    before(:each) do
      user = User.first
      4.times do
        FactoryBot.create(:article, aasm_state: 'draft', user_id: user.id)
      end
    end
  end

  def create_logged_user_published_articles
    before(:each) do
      user = User.first
      4.times do
        FactoryBot.create(:article, aasm_state: 'published', user_id: user.id)
      end
    end
  end
end
