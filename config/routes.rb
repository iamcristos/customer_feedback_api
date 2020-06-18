Rails.application.routes.draw do
  resources :customer_infos
  resources :company_staffs do
    member do
      patch :approve
    end
  end
  
  
  resources :customers do
    member do
      get :staffs
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/auth/login', to: 'authentication#customer_login'
  post '/auth/staff/login', to: 'authentication#customer_staff_login'
  # get '/customers/get_staffs', to: 'customers#get_staffs'
end
