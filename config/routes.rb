Rails.application.routes.draw do
  # get 'posts/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "welcome#index"
  resources :posts do
    resources :comments, only: [ :create, :destroy ]
  end

end
