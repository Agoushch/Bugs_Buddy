Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :activities, only: %i[show new create destroy] do
    resources :sports
    resources :user_activities do
      resources :comments
    end
  end
  get "dashboard", to: "pages#dashboard"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
