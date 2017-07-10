Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # next line added 7 jul 17 for teacher dashboard (lesson 34)
  resource :dashboard, only: [:show]
  
  # next line added 12 jun 17 to hook up route for landing page
  root "static_pages#index"
  
  # next line added 9 jul 17 for static pages (lesson 39)
  get 'privacy', to: 'static_pages#privacy'
  get 'team', to: 'static_pages#team'
  get 'careers', to: 'static_pages#careers'
  
  # next 3 lines added 27 jun 17 for student enrollments (lesson 27)
  resources :courses, only: [:index, :show] do
    resources :enrollments, only: :create
  end
  
  # next line added 15 jun 17 to hook up route for users page
  resources :users, only: :show
  
  # next line added 16 jun 17 to hook up route for student course pages
  resources :courses, only: [:index, :show]           # student course page

  # next line added 21 jun 17 to hook up route for lesson pages
  resources :lessons, only: [:show]                   # lesson show page
  
  # next line added 16 jun 17 to hook up route for instructor course pages
  namespace :instructor do                            # instructor course page
  # next line added 4 jul 17 for syncing of lesson updates (lesson 31)
    resources :lessons, only: [:update]
    resources :sections, only: [:update] do       # :update added 6 jul 17 for syncing sections (lesson/challenge 32)
      resources :lessons, only: [:create]         # :new removed 9 jul 17 for new lesson form modal (lesson 36)
    end
    resources :courses, only: [:new, :create, :show] do
        
# next line added 17 jun 17 to hook up route for instructor lesson page
      resources :sections, only: [:create, :update]   # :update added 6 jul 17 (lesson/challenge 32), :new deleted 7 jul 17 (lesson 35)
    end
  end
end
