Rails.application.routes.draw do
  resources :my_searches
  resources :articles do
    collection do
      post :search
    end
  end
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'articles#index'
end
