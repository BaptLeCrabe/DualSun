require 'test_helper'

class RecordTest < ActiveSupport::TestCase
  test "should not save record without required fields" do
    record = Record.new
    assert_not record.save, "Saved record without required fields"
  end

  test "should not save record with worng Company Siren" do
    record = Record.new(
      company_name: "Test Company",
      company_siren: 1234567,
      customer_name: "Test Customer",
      customer_phone: "0634058515",
      customer_mail: "baptmaury@gmail.com",
      worksite_address: "123 Test St",
      worksite_date: DateTime.now,
      worksite_panels: 10,
      worksite_panel_type_id: 1,
      worksite_panel_digit: 123456
    )
    assert_not record.save, "Saved record with wrong Company Siren"
  end

  test "should not save record with worng Worksite Panel Digit" do
    record = Record.new(
      company_name: "Test Company",
      company_siren: 123456789,
      customer_name: "Test Customer",
      customer_phone: "0634058515",
      customer_mail: "baptmaury@gmail.com",
      worksite_address: "123 Test St",
      worksite_date: DateTime.now,
      worksite_panels: 10,
      worksite_panel_type_id: 1,
      worksite_panel_digit: 1234
    )
    assert_not record.save, "Saved record with wrong Worksite Panel Digit"
  end

  test "should not save record with worng Worksite Panels" do
    record = Record.new(
      company_name: "Test Company",
      company_siren: 123456789,
      customer_name: "Test Customer",
      customer_phone: "0634058515",
      customer_mail: "baptmaury@gmail.com",
      worksite_address: "123 Test St",
      worksite_date: DateTime.now,
      worksite_panels: "TEST",
      worksite_panel_type_id: 1,
      worksite_panel_digit: 123456
    )
    assert_not record.save, "Saved record with wrong Worksite Panels"
  end

  test "should save record with all required fields" do
    record = Record.new(
      company_name: "Test Company",
      company_siren: 123456789,
      customer_name: "Test Customer",
      customer_phone: "0634058515",
      customer_mail: "baptmaury@gmail.com",
      worksite_address: "123 Test St",
      worksite_date: DateTime.now,
      worksite_panels: 10,
      worksite_panel_type_id: 1,
      worksite_panel_digit: 123456
    )
    assert record.save, "Could not save record with all required fields"
  end
end
