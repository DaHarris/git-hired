Rails.application.routes.draw do
  resources :users
  # You can have the root of your site routed with "root"
  root 'users#welcome'
  get '/auth/linkedin/callback' => 'users#show'

end
