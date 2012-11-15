Bertukar::Application.routes.draw do

  resources :search, only: [:index, :show]

  devise_for :users

  resources :jobs

  namespace :admin do
    resources :locations
    resources :ministries
  end

  root :to => 'search#index'
end
