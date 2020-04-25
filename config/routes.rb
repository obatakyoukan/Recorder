Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "top#index"
  get "about" => "top#about", as: "about"

  resources :users
  resource :session, only: [:create, :destroy]
end
