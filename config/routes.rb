Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  root "top_page#top"

  resources :users, only: %i[new create]
  resource :user_sessions, only: %i[new create destroy]
  resources :tasks, only: %i[new index show create edit update destroy]

  # Defines the root path route ("/")
  # root "posts#index"
end
