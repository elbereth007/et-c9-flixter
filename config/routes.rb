Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # next line added 12 jun 17 to hook up routes
  root "static_pages#index"
end
