require 'test_helper'

class EmployeesControllerTest < ActionController::TestCase
  setup do
    @employee = employees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employee" do
    assert_difference('Employee.count') do
      post :create, employee: { employee_id: @employee.employee_id, employee_id: @employee.employee_id, first_name: @employee.first_name, hire_date: @employee.hire_date, last_name: @employee.last_name, remaining_sick_days: @employee.remaining_sick_days, remaining_vacation_days: @employee.remaining_vacation_days, sick_days: @employee.sick_days, sick_days_used: @employee.sick_days_used, vacation_days: @employee.vacation_days, vacation_days_used: @employee.vacation_days_used }
    end

    assert_redirected_to employee_path(assigns(:employee))
  end

  test "should show employee" do
    get :show, id: @employee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employee
    assert_response :success
  end

  test "should update employee" do
    put :update, id: @employee, employee: { employee_id: @employee.employee_id, employee_id: @employee.employee_id, first_name: @employee.first_name, hire_date: @employee.hire_date, last_name: @employee.last_name, remaining_sick_days: @employee.remaining_sick_days, remaining_vacation_days: @employee.remaining_vacation_days, sick_days: @employee.sick_days, sick_days_used: @employee.sick_days_used, vacation_days: @employee.vacation_days, vacation_days_used: @employee.vacation_days_used }
    assert_redirected_to employee_path(assigns(:employee))
  end

  test "should destroy employee" do
    assert_difference('Employee.count', -1) do
      delete :destroy, id: @employee
    end

    assert_redirected_to employees_path
  end
end
