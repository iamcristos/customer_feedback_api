class AuthenticationController < ApplicationController
    before_action :authorize_request, except: :customer_login

    def customer_login
        @customer = Customer.find_by(:email => params[:email])
        puts('dhyhbdhfdhhfdjfh', @customer.to_s)
        
        if @customer&.authenticate(params[:password])
            token = JsonWebToken.encode(user_id: @customer.id)
            time = Time.now + 24.hours.to_i
            render json: {token: token, exp: time.strftime("%m-%d-%Y %H:%M"), email: @customer.email, id: @customer.id}, status: :ok
        else
            render json: {error: 'unathorized'}, status: :unathorized
        end
    end

    def customer_staff_login
        @staff = CompanyStaff.find_by(:email => params[:email])

        if @staff&.authenticate(params[:password])
            token = JsonWebToken.encode(user_id: @staff.id)
            time = Time.now + 24.hours.to_i
            render json: {token: token, exp: time.strftime("%m-%d-%Y %H:%M"), email: @customer.email, id: @customer.id}, status: :ok
        else
            render json: {error: 'unathorized'}, status: :unathorized
        end
    end
    

    private

    def login_params
        params.permit(:email, :password)
    end
    
end
