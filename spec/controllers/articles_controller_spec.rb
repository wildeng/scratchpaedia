require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe 'CRUD operations' do
    context 'with authenticated user' do
      login_user

      create_published_anonymous_articles
      create_draft_anonymous_articles
      create_logged_user_draft_articles
      create_logged_user_published_articles

      it 'can see her own articles both published and draft' do
        get :my_articles
        response.should render_template :index
      end

      it 'can edit her own article' do

      end

      it 'cannot edit someone else article' do

      end

      it 'can create an article' do

      end

    end

    context 'with anonymous user' do
      it 'should load only pusblished articles' do

      end

      it 'cannot edit any article' do

      end
    end

    context 'with any user' do
      it 'should render the index' do
        get :index
        response.should render_template :index
      end
      it 'can search an article by title-content' do

      end

      it 'can search an article by tag' do

      end
    end
  end
end
