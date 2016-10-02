Rails.application.routes.draw do
  resources :books, only: [:index, :create, :new, :destroy]
end
