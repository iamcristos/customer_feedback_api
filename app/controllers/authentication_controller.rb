class AuthenticationController < ApplicationController
    before_action :authorize_request(Customer), except: :customer_login

    def customer_login
        @customer = Customer.find_by_email(params[:email])
        
        if @customer&.authenticate(params[:password])
            token = JsonWebToken.encode(user_id: @customer.id)
            time = Time.now + 24.hours.to_i
            render json: {token, exp: time.striftime("%m-%d-%Y %H:%M"), email: @customer.email}, status: :ok
        else
            render json: {error: 'unathorized'}, status: :unathorized
        end

        private

        def login_params
            params.permit(:email, :password)
        end
    end
end
