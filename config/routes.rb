Rails.application.routes.draw do
devise_for :users
root to: 'pages#home'
resources :activities, only: %i[show new create destroy] do
  resources :user_activities, only: %i[create]
end
resources :sports
resources :user_activities, only: %i[ destroy] do
  resources :comments, only: %i[new create]
end
resources :comments, only: %i[destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
