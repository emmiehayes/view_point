Rails.application.routes.draw do

  root to: 'home#show'
  
  get '/auth/:provider/callback',  to: 'sessions#create'
  get '/auth/failure',             to: redirect('/')
  delete '/logout',                to: 'sessions#destroy'

  get '/dashboard', to: 'dashboard#show'
  get '/search', to: 'search#index'
end 
