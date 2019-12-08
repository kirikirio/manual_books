Rails.application.routes.draw do
  get 'users/new'
  get 'manual/index'
  resources :manual, only: [:index, :show, :new, :edit] 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
