Rails.application.routes.draw do
  resources :recipes, only: [:index]
  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'
  get 'about', to: 'pages#about'
  resources :users do
    resource :profile
    resources :recipes
    get 'all_recipes', to: 'recipes#user_recipes'
  end
  resources :tags
  get 'related_recipes', to: 'tags#related_recipes'
end
