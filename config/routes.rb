Rails.application.routes.draw do
  devise_scope :user do
    get 'admin', to: 'devise/sessions#new'
    get 'admin/edit', to: 'devise/registrations#edit'
    get 'users/sign_out', to: 'devise/sessions#destroy'
  end

  devise_for :users, :controllers => {:registrations => "users/registrations"}
  resources :gigs
  resources :albums

  get 'application/index'
  root 'application#index'
  get '/insta', to: 'instagram#index'
  get '/insta/update', to: 'instagram#update'
  get '/bookjoe', to: 'application#bookjoe'
  post '/mailer', to: 'application#mailer', as: 'mailer'
end
