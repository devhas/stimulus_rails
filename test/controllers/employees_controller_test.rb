require 'faker'
require "test_helper"

class EmployeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employee = employees(:one)
  end

  test "should get index" do
    get employees_url
    assert_response :success
  end

  test "should get new" do
    get new_employee_url(format: :turbo_stream)
    assert_response :success
  end

  test "should create employee" do
    assert_difference("Employee.count") do
      post employees_url, params: { employee: { email: Faker::Internet.email, first_name: @employee.first_name, last_name: @employee.last_name, nickname: @employee.nickname, phone_number: @employee.phone_number }, format: :turbo_stream }
    end

    assert_response :success
  end

  test "should not save employee without required fields" do
    employee = Employee.new
    assert_not employee.save, "Saved the employee without required parameters"
    assert !employee.valid?
		assert employee.errors.added? :first_name, :blank
  end

  test "should not save employee with too long first name" do
    employee = Employee.new(first_name: "John Saved the employee with ivalid phone number format Saved the employee with ivalid phone number format", last_name: "Cena", email: "john.cena@gmail.com", phone_number: "1234567")
    assert_not employee.save
    assert !employee.valid?
		assert employee.errors.added? :first_name, :too_long, count: 25
  end

  test "should not save employee with invalid phone number format" do
    employee = Employee.new(first_name: "John", last_name: "Cena", email: "john.cena@gmail.com", phone_number: "1234567")
    assert_not employee.save, "Saved the employee with ivalid phone number format"
    assert !employee.valid?
		assert employee.errors.added? :phone_number, "must be in the following format: xxx-xxx-xxxx"
  end

  test "should show employee" do
    get employee_url(@employee)
    assert_response :success
  end

  test "should get edit" do
    get edit_employee_url(@employee)
    assert_response :success
  end

  test "should update employee" do  	
    patch employee_url(@employee), params: { employee: { email: @employee.email, first_name: @employee.first_name, last_name: @employee.last_name, nickname: @employee.nickname, phone_number: @employee.phone_number }, format: :turbo_stream }
    assert_response :success
  end

  test "should destroy employee" do
    assert_difference("Employee.count", -1) do
      delete employee_url(@employee)
    end

    assert_redirected_to employees_url
  end
end
