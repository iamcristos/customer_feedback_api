require 'test_helper'

class CompanyStaffsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company_staff = company_staffs(:one)
  end

  test "should get index" do
    get company_staffs_url, as: :json
    assert_response :success
  end

  test "should create company_staff" do
    assert_difference('CompanyStaff.count') do
      post company_staffs_url, params: { company_staff: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show company_staff" do
    get company_staff_url(@company_staff), as: :json
    assert_response :success
  end

  test "should update company_staff" do
    patch company_staff_url(@company_staff), params: { company_staff: {  } }, as: :json
    assert_response 200
  end

  test "should destroy company_staff" do
    assert_difference('CompanyStaff.count', -1) do
      delete company_staff_url(@company_staff), as: :json
    end

    assert_response 204
  end
end
