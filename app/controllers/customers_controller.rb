class CustomersController < ApplicationController
  before_action :authorize_request, except: :create
  before_action :set_customer, only: [:show, :update, :destroy]

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all

    render json: @customers
  end

  # GET /customers/1
  # GET /customers/1.json
  def show

    render json: @customer
  end

  # # GET /customers/new
  # def new
  #   @customer = Customer.new
  # end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)

      if @customer.save
        render json: @customer, status: :created, location: @customer 
        # json: @article, status: :created, location:        api_v1_article_url(@article)
      else
        render json: @customer.errors, status: :unprocessable_entity 
      end
  end

  def staffs
  
    @staffs = Customer.find(params[:id])

    render json: @staffs.company_staffs, status: :ok
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update

    if @customer.update(customer_params)
      render json: @customer, status: :ok, location: @customer 
    else
      render json: @customer.errors, status: :unprocessable_entity 
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    render json: @customer,  message: 'Customer was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def customer_params
      params.require(:customer).permit(:email, :password, :description)
    end
end
