Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # next line added 12 jun 17 to hook up route for landing page
  root "static_pages#index"
  
  # next line added 15 jun 17 to hook up route for users page
  resources :users, only: :show
  
  # next line added 16 jun 17 to hook up route for student course pages
  resources :courses, only: [:index, :show]           # student course page

  # next line added 21 jun 17 to hook up route for lesson pages
  resources :lessons, only: [:show]                   # lesson show page
  
  # next line added 16 jun 17 to hook up route for instructor course pages
  namespace :instructor do                            # instructor course page
    resources :sections, only: [] do
      resources :lessons, only: [:new, :create]
    end
    resources :courses, only: [:new, :create, :show] do
        
# next line added 17 jun 17 to hook up route for instructor lesson page
      resources :sections, only: [:new, :create]
    end
  end
end
