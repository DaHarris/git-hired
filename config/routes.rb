Rails.application.routes.draw do
  resources :users
  resources :jobs

  get 'users/:id/git' => 'users#git', as: 'git'
  post 'users/:id/git' => 'users#destroy_repo', as: 'git_delete'
  post 'users/:id/edu' => 'users#update_edu', as: 'update_edu'

  post 'users/:id/looking' => 'looking_fors#create', as: 'create_lookings'
  match 'users/:id/update/:lf_id' => 'looking_fors#update', as: 'update_lookings', via: [:patch]

  post 'user/:id/edit' => 'users#edit_description', as: 'edit_description'

  get 'employments/:id/new' => 'employments#new', as: 'add_employment'
  get 'educations/:id/new' => 'educations#new', as: 'add_education'
  get 'skills/:id/new' => 'skills#new', as: 'add_skill'

  match 'first/:id' => 'users#first_splash', as: 'first_splash', via: [:get]
  match 'role/:id' => 'users#role_set', as: 'role_set', via: [:patch]
  match 'second/:id' => 'users#second_splash', as: 'second_splash', via: [:get]
  match 'gitid/:id' => 'users#git_set', as: 'git_set', via: [:patch]
  match 'third/:id' => 'users#third_splash', as: 'third_splash', via: [:get]
  match 'projects/:id' => 'users#project_set', as: 'project_set', via: [:post]

  match 'search' => 'searches#search', as: 'search', via: [:get, :post]


  # You can have the root of your site routed with "root"
  root 'users#welcome'
  match "/auth/linkedin/callback" => "sessions#create", via: [:get, :post]
  match '/auth/failure', to: redirect('/'), via: [:get, :post]
  match "/signout" => "sessions#destroy", as: 'signout', via: [:get, :post]



end
