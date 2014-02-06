require 'test_helper'

class CustomersControllerTest < ActionController::TestCase
  setup do
    @customer = customers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customer" do
    assert_difference('Customer.count') do
      post :create, customer: { address: @customer.address, cash: @customer.cash, comment: @customer.comment, deliv_store: @customer.deliv_store, delivery_date: @customer.delivery_date, doctor: @customer.doctor, lft_ax: @customer.lft_ax, lft_cl: @customer.lft_cl, lft_sp: @customer.lft_sp, mobile: @customer.mobile, name: @customer.name, paid: @customer.paid, phone: @customer.phone, remained: @customer.remained, req_store: @customer.req_store, request_date: @customer.request_date, rght_ax: @customer.rght_ax, rght_cl: @customer.rght_cl, rght_sp: @customer.rght_sp, work: @customer.work }
    end

    assert_redirected_to customer_path(assigns(:customer))
  end

  test "should show customer" do
    get :show, id: @customer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @customer
    assert_response :success
  end

  test "should update customer" do
    patch :update, id: @customer, customer: { address: @customer.address, cash: @customer.cash, comment: @customer.comment, deliv_store: @customer.deliv_store, delivery_date: @customer.delivery_date, doctor: @customer.doctor, lft_ax: @customer.lft_ax, lft_cl: @customer.lft_cl, lft_sp: @customer.lft_sp, mobile: @customer.mobile, name: @customer.name, paid: @customer.paid, phone: @customer.phone, remained: @customer.remained, req_store: @customer.req_store, request_date: @customer.request_date, rght_ax: @customer.rght_ax, rght_cl: @customer.rght_cl, rght_sp: @customer.rght_sp, work: @customer.work }
    assert_redirected_to customer_path(assigns(:customer))
  end

  test "should destroy customer" do
    assert_difference('Customer.count', -1) do
      delete :destroy, id: @customer
    end

    assert_redirected_to customers_path
  end
end
