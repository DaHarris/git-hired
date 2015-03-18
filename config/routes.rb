Rails.application.routes.draw do
  resources :users

  get 'users/:id/git' => 'users#git', as: 'git'

  match 'first/:id' => 'users#first_splash', as: 'first_splash', via: [:get]
  match 'role/:id' => 'users#role_set', as: 'role_set', via: [:patch]
  match 'second/:id' => 'users#second_splash', as: 'second_splash', via: [:get]
  match 'gitid/:id' => 'users#git_set', as: 'git_set', via: [:patch]
  match 'third/:id' => 'users#third_splash', as: 'third_splash', via: [:get]
  match 'projects/:id' => 'users#project_set', as: 'project_set', via: [:post]


  # You can have the root of your site routed with "root"
  root 'users#welcome'
  match "/auth/linkedin/callback" => "sessions#create", via: [:get, :post]
  match "/signout" => "sessions#destroy", as: 'signout', via: [:get, :post]

end
