Rails.application.routes.draw do
  get 'searches/seach'
  devise_for :users
  root to: 'home#top'
  get 'home/about' => 'home#about', as: 'home_about'
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :bookcomments, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update] do
    resources :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  get 'searches/search' => 'searches#search', as: 'search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
