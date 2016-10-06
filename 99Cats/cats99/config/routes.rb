Rails.application.routes.draw do
  post 'cat_rental_requests/approve'
  post 'cat_rental_requests/deny'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cats

  resources :cat_rental_requests, only: [:new, :create]
end
