Bertukar::Application.routes.draw do

  resources :search, only: [:index, :show]

  devise_for :users, controllers: { registrations: 'registrations' }

  resources :jobs

  namespace :admin do
    resources :locations
    resources :ministries
    resources :jobs, only: [:index, :show]
    resources :users, only: [:index, :show, :destroy]
  end

  root :to => 'search#index'
end
