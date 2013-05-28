require 'test_helper'

class FurloughsControllerTest < ActionController::TestCase
  setup do
    @furlough = furloughs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:furloughs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create furlough" do
    assert_difference('Furlough.count') do
      post :create, furlough: { date_from: @furlough.date_from, date_to: @furlough.date_to, description: @furlough.description, duration: @furlough.duration, employee_id: @furlough.employee_id, length_of_day: @furlough.length_of_day, note: @furlough.note }
    end

    assert_redirected_to furlough_path(assigns(:furlough))
  end

  test "should show furlough" do
    get :show, id: @furlough
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @furlough
    assert_response :success
  end

  test "should update furlough" do
    put :update, id: @furlough, furlough: { date_from: @furlough.date_from, date_to: @furlough.date_to, description: @furlough.description, duration: @furlough.duration, employee_id: @furlough.employee_id, length_of_day: @furlough.length_of_day, note: @furlough.note }
    assert_redirected_to furlough_path(assigns(:furlough))
  end

  test "should destroy furlough" do
    assert_difference('Furlough.count', -1) do
      delete :destroy, id: @furlough
    end

    assert_redirected_to furloughs_path
  end
end
