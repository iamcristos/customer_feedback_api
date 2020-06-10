class CompanyStaffsController < ApplicationController
  before_action :set_company_staff, only: [:show, :update, :destroy]

  # GET /company_staffs
  # GET /company_staffs.json
  def index
    @company_staffs = CompanyStaff.all
  end

  # GET /company_staffs/1
  # GET /company_staffs/1.json
  def show

    render json: @company_staff
  end

  # POST /company_staffs
  # POST /company_staffs.json
  def create
    @company_staff = CompanyStaff.new(company_staff_params)

    if @company_staff.save
      render :show, status: :created, location: @company_staff
    else
      render json: @company_staff.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /company_staffs/1
  # PATCH/PUT /company_staffs/1.json
  def update
    if @company_staff.update(company_staff_params)
      render :show, status: :ok, location: @company_staff
    else
      render json: @company_staff.errors, status: :unprocessable_entity
    end
  end

  # confirm staff member

  def company_staffs
    @staffs = CompanyStaff.confirm(params[:id])
    render json: @staffs, status: :ok
  end
  

  # DELETE /company_staffs/1
  # DELETE /company_staffs/1.json
  def destroy
    @company_staff.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_staff
      @company_staff = CompanyStaff.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def company_staff_params
      params.fetch(:company_staff, {}).permit(:email, :password, :full_name, :customer_id)
    end
    
end
