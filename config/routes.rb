Rails.application.routes.draw do
  get 'messages/conversations'
  get 'messages/index'
  get 'messages/create'
  root 'static_pages#index'
  devise_for :users
  resources :users, only: [:show] do
  resources :avatars, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'ads#index'
  resources :ads
  resources :trainings

  get 'conversations', to: 'messages#conversations'
  resources :users do
    resources :messages, only: [:index, :create]
  end

end
