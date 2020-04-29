Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "top#index"
  get "about" => "top#about", as: "about"

  resources :users
  resources :books 
  resources :searches do
    get "book", on: :collection
  end

  resource :session, only: [:create, :destroy]
  resource :account, only: [:show, :edit, :update ]
  resource :password, only: [:show, :edit, :update]
  resource :erase, only:[:destroy]


end
