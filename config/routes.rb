Rails.application.routes.draw do
  get 'profiles/show'
  get 'anounces/index'
  get 'anounces/show'
  get 'anounces/new'
  get 'anounces/create'
  get 'anounces/edit'
  get 'anounces/update'
  get 'anounces/destroy'
   get 'mes-anounces', to: 'anounces#mes_anounces', as: 'mes_anounces'

  devise_for :users

  resources :anounces
  resources :cities
  resources :categories

 
 get 'profile', to: 'profiles#show'
 get 'profile/edit', to: 'profiles#edit', as: 'edit_profile'
 patch 'profile', to: 'profiles#update'

  root "anounces#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
