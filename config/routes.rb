Rails.application.routes.draw do
  root 'manuals#index'
  devise_for :users
  get 'users/new'
  get 'manuals/rezi'
  get 'manuals/seisou'
  get 'manuals/cofee'
  get 'manuals/sekkyaku'
  get 'manuals/sonota'
  get 'manuals/top'
  get 'manuals/flyer'
  get 'manuals/show'
  # get '/show', to: 'manuals#show'
  # post '/show', to: 'manuals#show'
  get '/list', to: 'manuals#list'
  post '/list', to: 'manuals#list'
  # get 'manual/index'
  # # get 'manual/new'
  # post 'manual/create'
  resources :manuals, only: [:index, :create,:list,:show,:new] 
    
  namespace :admin do
    resources :manuals
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
