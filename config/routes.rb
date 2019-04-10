Rails.application.routes.draw do
  devise_for :installs
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :hinanjyos, :path => 'shelters', as: 'shelters', only: [ :index, :show, ] do
    resources :posts, only: [ :new, :create ]
  end

  get 'shelters/:id/favorite', to: 'hinanjyos#favorite', as: 'favorite_shelter'

  resources :posts, only: [ :show, :edit, :update, :destroy ] do
    resources :comments, only: [ :new, :create ]
  end

  resources :comments, only: [ :edit, :update, :destroy]

  # notifications uses the comments index view
  get 'notifications', to: 'comments#index', as: 'notifications'

  # NGO map search page
  namespace :helpers do
    resources :hinanjyos, :path => 'shelters', as: 'shelters', only: [:index]
  end

  # area_info is in posts index
  # item_search is in posts index
end
