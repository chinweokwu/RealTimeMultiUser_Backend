Rails.application.routes.draw do
  post 'login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  get "/auto_login", to: "sessions#auto_login"
  mount ActionCable.server => '/cable'
end
