Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :books
  resources :book_loans

  #root "books#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
