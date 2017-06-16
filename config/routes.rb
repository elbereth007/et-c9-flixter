Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # next line added 12 jun 17 to hook up route for landing page
  root "static_pages#index"
  
  # next line added 15 jun 17 to hook up route for users page
  resources :users, only: :show
end
