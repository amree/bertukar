Bertukar::Application.routes.draw do

  match '/about' => 'pages#about'

  resources :search, only: [:index, :show]

  devise_for :users, controllers: { registrations: 'registrations' }

  resources :jobs

  namespace :admin do
    resources :locations
    resources :ministries
    resources :jobs, only: [:index, :show]
    resources :users, only: [:index, :show, :destroy]
  end

  match 'sitemap', :to => "sitemap#index", :as => :sitemap
  match 'listings/states/:id' => "listings#states", :as => :listings_states

  root :to => 'search#index'
end
