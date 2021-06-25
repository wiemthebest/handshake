Rails.application.routes.draw do
   mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'static_pages#index'
  get 'messages/conversations'
  get 'messages/index'
  get 'messages/create'
  devise_for :users
  resources :users do
    resources :avatars, only: [:create]
  end
  resources :ads
  get 'benevoles', to: 'ads#benevoles'
  get 'demandeurs', to: 'ads#demandeurs'
  resources :trainings
  resources :contact, only: [:new, :create]
  get 'conversations', to: 'messages#conversations'
  resources :users do
    resources :messages, only: [:index, :create]
  end
  resources :categories
end
