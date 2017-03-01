Rails.application.routes.draw do
  devise_scope :user do
    get 'admin', to: 'devise/sessions#new'
    get 'admin/edit', to: 'devise/registrations#edit'
  end

  devise_for :users, :controllers => {:registrations => "users/registrations"}

  resources :gigs
  resources :albums
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'application/index'
  root 'application#index'
  get '/insta', to: 'application#instagram'
  get '/merch', to: 'application#merch'
end
