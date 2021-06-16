Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 root 'ads#index'
 devise_for :users
 get 'ads/dashboard', to: 'ads#dashboard'
 resources :ads 

end
