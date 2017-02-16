Rails.application.routes.draw do
  resources :gigs
  resources :albums
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'application/index'
  root 'application#index'
  get '/insta', to: 'application#instagram'
  get '/merch', to: 'application#merch'
end
