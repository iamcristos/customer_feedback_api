class AuthenticationController < ApplicationController
    before_action :authorize_request(Customer), except: :customer_login

    def customer_login
        @customer = Customer.find_by_email(params[:email])
        if @customer&.authenticate(params[:password])
            token = JsonWebToken.encode(user_id: @customer.id)
        end
    end
end
