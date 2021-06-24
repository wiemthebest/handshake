Rails.application.routes.draw do
  root 'static_pages#index'
  get 'messages/conversations'
  get 'messages/index'
  get 'messages/create'
  devise_for :users
  resources :users do
  resources :avatars, only: [:create]
  end
  resources :ads
  resources :trainings
  resources :contact, only: [:new, :create]
  get 'conversations', to: 'messages#conversations'
  resources :users do
    resources :messages, only: [:index, :create]
  end

end
