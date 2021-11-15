Rails.application.routes.draw do
  devise_for :users
  root to: 'home#top'
  get 'home/about' => 'home#about', as:'home_about'
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]end
  resources :users, only: [:index, :show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
