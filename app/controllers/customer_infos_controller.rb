class CustomerInfosController < ApplicationController

    def index
        @customer_infos = CustomerInfo.all
        render json: @customer_infos, status: :ok
    end
    def create
        @customer_info = CustomerInfo.new(customer_info_params)

        if @customer_info.save 
            render json: @customer_info, status: :created
        else
            render json: @customer_info.errors, status: :unprocessable_entity
        end
    end

    private

    def customer_info_params
        params.permit(:email, :customer_name)
    end
end
