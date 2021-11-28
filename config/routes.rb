Rails.application.routes.draw do
devise_for :users
root to: 'pages#home'
get 'dashboard', to: 'pages#dashboard'
resources :sports
resources :activities, only: %i[show new create destroy] do
  resources :user_activities, only: %i[create]
end
resources :user_activities, only: %i[destroy] do
  resources :comments, only: %i[new create]
end
resources :preferences, only: %i[new create edit update destroy]
resources :comments, only: %i[destroy]
end
