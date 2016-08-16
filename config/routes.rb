Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :users
      resources :booking_requests
      resources :reviews
      resources :parents, :babysitters, :requests
      resources :sessions
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
