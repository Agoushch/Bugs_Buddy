Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :activities, only: %i[show new create destroy] do
    resources :user_activities do
      resources :comments
    end
    end
  end
  resources :sports
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
