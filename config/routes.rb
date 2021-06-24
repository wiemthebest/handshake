Rails.application.routes.draw do
  root 'static_pages#index'
  devise_for :users
  resources :users do
    resources :messages, only: [:index, :create]
  end
  resources :users, only: [:show] do
    resources :avatars, only: [:create]
  end
  get 'conversations', to: 'messages#conversations'
  resources :contact, only: [:conversations, :index, :create]
  resources :ads
  resources :contact, only: [:new, :create]
  resources :trainings

end
