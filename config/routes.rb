Rails.application.routes.draw do
  get 'password_resets/create'
  get 'password_resets/edit'
  get 'password_resets/update'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  root "top_page#top"

  resources :users, only: %i[new create]
  resource :profile, only: %i[show edit update]
  resource :user_sessions, only: %i[new create destroy]
  resources :password_resets, only: %i[new edit update create]

  resources :tasks, only: %i[new index show create edit update destroy]
  resources :calendars, only: %i[index]

  namespace :admin do
    root "dashboards#index"
    resource :dashboard, only: %i[index]
    get 'login' => 'user_sessions#new', :as => :login
    post 'login' => "user_sessions#create"
    delete 'logout' => 'user_sessions#destroy', :as => :logout
    resources :users, only: %i[index show edit update destroy]
    resources :tasks, only: %i[index show edit update destroy]
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end  

  # Defines the root path route ("/")
  # root "posts#index"
end
