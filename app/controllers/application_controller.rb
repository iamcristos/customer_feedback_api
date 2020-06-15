class ApplicationController < ActionController::API

    def not_found

        render json: {error: 'not found'}
    end

    def authorize_request
       return authorize_user
    end
    
    def admin_auth
        authorize_user
        if !@current_user.admin
            render json: { errors: 'unauthorized action'}, status: :unauthorized
        end
    end

    private

    def authorize_user
        header = request.headers['Authorization']
        header = header.split(' ').last if header

        if header
            begin
                @decoded = JsonWebToken.decode(header)
                @current_user = Customer.find(@decoded[:user_id])
            rescue JWT::DecodeError => e
                render json: { errors: e.message }, status: :unauthorized
            rescue ActiveModel::RecordNotFound => e
                render json: { errors: e.message }, status: :unauthorized
            end
        else
            render json: {errors: 'token required'}, status: :unauthorized
        end
    end
    
end
