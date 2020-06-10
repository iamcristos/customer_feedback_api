Rails.application.routes.draw do
  resources :company_staffs
  
  
  resources :customers do
    member do
      get :staffs
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/auth/login', to: 'authentication#customer_login'
  # get '/customers/get_staffs', to: 'customers#get_staffs'
end
