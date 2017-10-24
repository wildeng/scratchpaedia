Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  authenticate :user do
    resources :articles, only: %i[new create edit update destroy]
  end

  get 'articles/search_articles', to: 'articles#search_articles'
  get 'articles/my_articles', to: 'articles#my_articles'
  resources :articles, only: %i[index show]
  root 'articles#index'
  get 'tags/:tag', to: 'articles#index', as: :tag
  # get 'articles/index' => 'articles#index'
  # resources :articles
end
