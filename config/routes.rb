Rails.application.routes.draw do
  resources :messages
  # added by scaffold
  resources :communications
  
  devise_for :users,
    path: '',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      sign_up: 'register'
    }

  resources :users
  # get '/about', to: 'home#about'
  get '/dave', to: 'home#dave'
  get '/secret', to: 'home#secret'
  get '/upload', to: 'home#upload'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"
  mount Spina::Engine => '/'
end
