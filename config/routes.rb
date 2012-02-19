Pertukaran::Application.routes.draw do

  get "search/index"

  devise_for :users

  resources :jobs

  namespace :admin do
    resources :locations
    resources :ministries
    resources :titles
  end

  root :to => 'search#index'
end
