Rails.application.routes.draw do
  devise_for :users
  resources :my_searches
  resources :articles do
    collection do
      post :search
    end
  end
  resources :users, only: %i[show create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'articles#index'
end
