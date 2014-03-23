require 'test_helper'

class EmpolyeesControllerTest < ActionController::TestCase
  setup do
    @empolyee = empolyees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:empolyees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create empolyee" do
    assert_difference('Empolyee.count') do
      post :create, empolyee: { address: @empolyee.address, age: @empolyee.age, birthday: @empolyee.birthday, comment: @empolyee.comment, mobile: @empolyee.mobile, mobile_2: @empolyee.mobile_2, name: @empolyee.name, national_id: @empolyee.national_id, phone: @empolyee.phone, role: @empolyee.role, salary: @empolyee.salary }
    end

    assert_redirected_to empolyee_path(assigns(:empolyee))
  end

  test "should show empolyee" do
    get :show, id: @empolyee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @empolyee
    assert_response :success
  end

  test "should update empolyee" do
    patch :update, id: @empolyee, empolyee: { address: @empolyee.address, age: @empolyee.age, birthday: @empolyee.birthday, comment: @empolyee.comment, mobile: @empolyee.mobile, mobile_2: @empolyee.mobile_2, name: @empolyee.name, national_id: @empolyee.national_id, phone: @empolyee.phone, role: @empolyee.role, salary: @empolyee.salary }
    assert_redirected_to empolyee_path(assigns(:empolyee))
  end

  test "should destroy empolyee" do
    assert_difference('Empolyee.count', -1) do
      delete :destroy, id: @empolyee
    end

    assert_redirected_to empolyees_path
  end
end
