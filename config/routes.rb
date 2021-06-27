Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'static_pages#index'
  resources :messages, only: [:index, :create, :conversations]
  devise_for :users
  resources :users do
    resources :avatars, only: [:create]
  end
  resources :ads
  get 'benevoles', to: 'ads#benevoles'
  get 'demandeurs', to: 'ads#demandeurs'
  get 'conversations', to: 'messages#conversations'
  resources :trainings
  resources :contact, only: [:new, :create]
  resources :users do
    resources :messages, only: [:index, :create]
  end

end