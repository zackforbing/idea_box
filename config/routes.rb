Rails.application.routes.draw do

  root to: 'users#none' # unless current_user

  get "users/none", to: 'users#none'

  resources :users, only: [:new, :create, :show] do
    resources :ideas
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
