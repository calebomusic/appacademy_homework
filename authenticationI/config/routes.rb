Rails.application.routes.draw do
  get 'sessions_controller/new'

  get 'users/new'

  resource :session
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
