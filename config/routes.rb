Rails.application.routes.draw do

  get '/static_pages/team', to: 'static_pages#team'
  get '/static_pages/contact', to: 'static_pages#contact', as: 'test'
  get '/', to: 'static_pages#home'
  
  resources :gossips
  root to: 'gossips#index'
  resources :sessions
  resources :users
  
  
end

