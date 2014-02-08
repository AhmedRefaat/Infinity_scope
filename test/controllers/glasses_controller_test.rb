require 'test_helper'

class GlassesControllerTest < ActionController::TestCase
  setup do
    @glass = glasses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:glasses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create glass" do
    assert_difference('Glass.count') do
      post :create, glass: { discount_rate: @glass.discount_rate, discount_rate_2: @glass.discount_rate_2, frame_kind: @glass.frame_kind, made_in: @glass.made_in, quantity: @glass.quantity, type: @glass.type, unity_price: @glass.unity_price }
    end

    assert_redirected_to glass_path(assigns(:glass))
  end

  test "should show glass" do
    get :show, id: @glass
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @glass
    assert_response :success
  end

  test "should update glass" do
    patch :update, id: @glass, glass: { discount_rate: @glass.discount_rate, discount_rate_2: @glass.discount_rate_2, frame_kind: @glass.frame_kind, made_in: @glass.made_in, quantity: @glass.quantity, type: @glass.type, unity_price: @glass.unity_price }
    assert_redirected_to glass_path(assigns(:glass))
  end

  test "should destroy glass" do
    assert_difference('Glass.count', -1) do
      delete :destroy, id: @glass
    end

    assert_redirected_to glasses_path
  end
end
