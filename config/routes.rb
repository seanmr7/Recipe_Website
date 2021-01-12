Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'
  get 'about', to: 'pages#about'
  resources :users do
    resource :profile
  end
end
