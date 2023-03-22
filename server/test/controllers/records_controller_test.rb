require "test_helper"

class RecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @record = records(:one)
  end

  test "should get index" do
    get records_url, as: :json
    assert_response :success
  end

  test "should create record" do
    assert_difference('Record.count') do
      post records_url, params: { record: { company_name: @record.company_name, company_siren: @record.company_siren, customer_mail: @record.customer_mail, customer_name: @record.customer_name, customer_phone: @record.customer_phone, worksite_address: @record.worksite_address, worksite_date: @record.worksite_date, worksite_panel_digit: @record.worksite_panel_digit, worksite_panel_type_id: @record.worksite_panel_type_id, worksite_panels: @record.worksite_panels } }, as: :json
    end

    assert_response 201
  end

  test "should not create record with wrong params" do
    post records_url, params: { record: { company_name: @record.company_name, company_siren: @record.company_siren, customer_mail: @record.customer_mail, customer_name: @record.customer_name, customer_phone: @record.customer_phone, worksite_address: @record.worksite_address, worksite_date: @record.worksite_date, worksite_panel_digit: 123, worksite_panel_type_id: @record.worksite_panel_type_id, worksite_panels: @record.worksite_panels } }, as: :json

    assert_response 422
  end

  test "should show record" do
    get record_url(@record), as: :json
    assert_response :success
  end

  test "should update record" do
    patch record_url(@record), params: { record: { company_name: @record.company_name + "TESST", company_siren: 567890122, customer_mail: "another@gmail.com", customer_name: "Other Name", customer_phone: "0786879987", worksite_address: "12 RANDOM STREET", worksite_date: DateTime.now(), worksite_panel_digit: 654321, worksite_panel_type_id: 2, worksite_panels: 13 } }, as: :json
    assert_response 200
  end

  test "should not update record with wrong params" do
    patch record_url(@record), params: { record: { company_siren: 123 } }, as: :json
    assert_response 422
  end

  test "should destroy record" do
    assert_difference('Record.count', -1) do
      delete record_url(@record), as: :json
    end

    assert_response 204
  end
end