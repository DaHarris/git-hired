Rails.application.routes.draw do
  resources :users
  # You can have the root of your site routed with "root"
  root 'users#welcome'
  match "/auth/linkedin/callback" => "sessions#create", via: [:get, :post]
  match "/signout" => "sessions#destroy", as: 'signout', via: [:get, :post]

end
