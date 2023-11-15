Rails.application.routes.draw do
  resources :favourites
  mount ActionCable.server => '/cable'
 
  post 'signup_parent', to: 'parents#create'
  post 'signup_caregiver', to: 'caregivers#create'
  post 'parent_login', to: 'sessions#parent_login'
  post 'caregiver_login', to: 'sessions#caregiver_login'

  delete '/caregiver/logout', to: 'sessions#logout_caregiver'
  delete '/logout', to: 'sessions#logout_parent'

  #get 'login/forgot_password?'

  #password reset routes
  post 'password/forgot_password', to: 'password_resets#forgot'
  post 'password/reset_password', to: 'password_resets#reset'

  get '/parent', to: 'parents#show'
  get '/caregiver', to: 'caregivers#show_caregiver'

 
  post 'parent_login/google', to: 'parents#google'

  # *** 
  #  scope :parent do
  #    post 'google' => 'users#user_controller.rb'
  #  end

  resources :parent_addresses
  resources :parents
  resources :reviews
  resources :caregivers
  resources :images
  resources :locations

  get 'bookings', to: 'bookings#index'
  get 'bookings/:id', to: 'bookings#show'
  post 'bookings', to: 'bookings#create'
  post 'bookings/:id', to: 'bookings#update'
  post 'bookings/:id/delete', to: 'bookings#destroy'
  post 'bookings/:id/accept', to: 'bookings#accept'
  post 'bookings/:id/reject', to: 'bookings#reject'
  
 
#   post '/authenticate', to: 'authentication#authenticate'

  get '*path', to: "application#fallback_index_html", constraints: ->(request) do
    !request.xhr? && request.format.html?
  end

  resources :caregivers do
    resources :reviews, only: [:index]
  end

  resources :caregivers do
    resources :bookings, only: [:index]
  end

  resources :parents do
    resources :bookings, only: [:index, :show]
  end
  resources :parents do
    resources :caregivers, only: [] do
        resources :bookings, only: [:index]
    end
  end

  resources :bookings do
    get 'caregiver/:caregiver_id', to: 'bookings#index_by_caregiver', on: :collection
  end
  
  
  get '/caregivers/booked_by_parent/:parent_id', to: 'caregivers#booked_by_parent'

  get 'parents/:parent_id/caregivers/:caregiver_id/bookings', to: 'bookings#index_by_parent_and_caregiver'

  get '/caregivers/:caregiver_id/bookings', to: 'bookings#show_caregiver_booking'
  get '/caregivers/:caregiver_id/bookings/parents', to: 'bookings#index_by_caregiver_and_parent'
  patch '/bookings/:id/toggle', to: 'bookings#toggle'
  get '/parents/:parent_id/bookings', to: 'bookings#index_by_parent'





  
  
  resources :parent_addresses
  resources :parents
  resources :reviews
  resources :caregivers
  resources :images
  resources :locations
  resources :bookings

end
