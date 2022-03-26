Rails.application.routes.draw do
  # get 'posts/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "welcome#index"
  resources :posts do
    resources :comments, only: [ :create, :destroy ]
  end
  resources :users do
    get 'edit_password', to: 'users#edit_password', as: 'edit_password'
    patch 'update_password', to: 'users#update_password', as: 'update_password'
  end
  resources :sessions, only:[ :new, :destroy, :create ]
  delete "/sessions",to: "sessions#destroy", as: :session_delete

end
