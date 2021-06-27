Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'static_pages#index'
  devise_for :users
  resources :users do
  resources :avatars, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'ads#index'
  resources :ads
  resources :trainings
  resources :contact, only: [:new, :create]
end
