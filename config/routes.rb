Rails.application.routes.draw do
devise_for :users
root to: 'pages#home'
get 'dashboard', to: 'pages#dashboard'
resources :activities, only: %i[show new create destroy] do
  resources :user_activities, only: %i[create]
end
resources :sports
resources :user_activities, only: %i[ destroy] do
  resources :comments, only: %i[new create]
end
resources :comments, only: %i[destroy]
resources :sports do
  collection do
    get :categories
  end
end
end
