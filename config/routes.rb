Rails.application.routes.draw do
  get 'users/new'
  get 'manuals/rezi'
  get 'manuals/seisou'
  get 'manuals/cofee'
  get 'manuals/sekkyaku'
  get 'manuals/sonota'
  get 'manuals/top'
  get 'manuals/flyer'
  get 'manuals/show'
  get '/show', to: 'manuals#show'
  post '/show', to: 'manuals#show'
  # get 'manual/index'
  # # get 'manual/new'
  # post 'manual/create'
  resources :manuals, only: [:index, :new, :create] 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
