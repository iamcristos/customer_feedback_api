Rails.application.routes.draw do
  resources :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/auth/login', to: 'authentication#customer_login'
end
