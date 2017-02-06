Rails.application.routes.draw do
  resources :albums
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'application/index'
  root 'application#index'
  get '/insta', to: 'application#instagram'
end
