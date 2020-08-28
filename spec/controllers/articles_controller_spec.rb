# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe 'CRUD operations' do
    context 'with authenticated user' do
      login_user

      create_published_anonymous_articles
      create_draft_anonymous_articles
      create_logged_user_draft_articles
      create_logged_user_published_articles

      let(:title) { 'Smack my bitch up' }
      let(:content) { 'Prodigy released this song in November 1997' }

      it 'can see her own articles both published and draft' do
        get :my_articles
        expect(response).to render_template :index
        expect(assigns(:articles).empty?).to_not be(true)
        # it only 4 because it's paged
        expect(assigns(:articles).size).to eq(4)
      end

      it 'can edit her own article' do
        article = User.first.articles.first
        get :edit, params: { id: article.id }
        expect(response).to render_template :edit
      end

      it 'can delete his own article' do
        article = User.first.articles.first
        article_id = article.id
        delete :destroy, params: { id: article.id }
        expect(response).to render_template :index
        expect { Article.find(article_id) }.to raise_exception(
          ActiveRecord::RecordNotFound
        )
      end

      it 'can change article title' do
        article = User.first.articles.first
        patch :update, params: {
          id: article.id,
          route_to: { save: 'Save' },
          article:
            {
              title: title,
              content: article.content
            }
        }
        expect(response).to redirect_to assigns(:article)
        expect(assigns(:article).title).to eq(title)
        expect(assigns(:article).aasm_state).to eq('published')
      end

      it 'can update an article state to draft' do
        article = User.first.articles.first
        patch :update, params: {
          id: article.id,
          route_to: { draft: 'Save draft' },
          article:
            {
              title: 'new title',
              content: article.content
            }
        }
        expect(response).to redirect_to assigns(:article)
        expect(assigns(:article).title).to eq('new title')
        expect(assigns(:article).aasm_state).to eq('draft')
      end

      it 'throws an error when updating and title is empty' do
        article = User.first.articles.first
        patch :update, params: {
          id: article.id,
          route_to: { save: 'Save' },
          article:
            {
              title: '',
              content: article.content
            }
        }
        expect(response).to render_template(:edit)
      end

      it 'cannot edit someone else article' do
        article = Article.first
        get :edit, params: { id: article.id }
        expect(response.status).to eq(404)
      end

      it 'can create an empty article' do
        get :new
        expect(response.status).to eq(200)
        expect(response).to render_template(:new)
      end

      it 'creates and saves her own draft article' do
        post :create, params: {
          route_to: { draft: 'Save draft' },
          article:
            {
              title: title,
              article: content
            }
        }
        expect(response).to redirect_to assigns(:article)
        expect(assigns(:article).title).to eq(title)
        expect(assigns(:article).aasm_state).to eq('draft')
      end

      it 'creates and saves his own published article' do
        post :create, params: {
          route_to: { save: 'Save' },
          article:
            {
              title: title,
              article: content
            }
        }
        expect(response).to redirect_to assigns(:article)
        expect(assigns(:article).aasm_state).to eq('published')
      end

      it 'throws an error when title is blank' do
        post :create, params: {
          route_to: { save: 'Save' },
          article:
            {
              title: '',
              article: content
            }
        }
        expect(response).to render_template(:new)
      end
    end

    context 'with anonymous user' do
      create_published_anonymous_articles

      it 'should render the index' do
        get :index
        response.should render_template :index
      end

      it 'can search an article by title-content' do
        article = Article.first
        get :search_articles, params: {
          article: {
            fulltext: article.title[0..3]
          }
        }
        expect(response.status).to eq(200)
        expect(response).to render_template :index
        expect(assigns(:articles).size).to be > 0
      end

      it 'return to index when asked for a reserved page' do
        get :my_articles
        expect(response).to redirect_to(new_user_session_path)
      end

      it 'shows an article' do
        article = Article.where(aasm_state: 'published').first
        get :show, params: { id: article.id }
        expect(response.status).to eq(200)
        expect(response).to render_template :show
      end

      it 'should load only pusblished articles' do
        get :index
        # it only 4 because it's paged
        expect(assigns(:articles).size).to eq(4)
        assigns(:articles).each do |article|
          expect(article.aasm_state).to eq('published')
        end
      end

      it 'cannot edit any article' do
        article = Article.first
        get :edit, params: { id: article.id }
        expect(response.status).to eq(302)
      end
    end
  end
end
