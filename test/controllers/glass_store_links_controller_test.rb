require 'test_helper'

class GlassStoreLinksControllerTest < ActionController::TestCase
  setup do
    @glass_store_link = glass_store_links(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:glass_store_links)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create glass_store_link" do
    assert_difference('GlassStoreLink.count') do
      post :create, glass_store_link: { glass_id: @glass_store_link.glass_id, quantity: @glass_store_link.quantity, store_id: @glass_store_link.store_id }
    end

    assert_redirected_to glass_store_link_path(assigns(:glass_store_link))
  end

  test "should show glass_store_link" do
    get :show, id: @glass_store_link
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @glass_store_link
    assert_response :success
  end

  test "should update glass_store_link" do
    patch :update, id: @glass_store_link, glass_store_link: { glass_id: @glass_store_link.glass_id, quantity: @glass_store_link.quantity, store_id: @glass_store_link.store_id }
    assert_redirected_to glass_store_link_path(assigns(:glass_store_link))
  end

  test "should destroy glass_store_link" do
    assert_difference('GlassStoreLink.count', -1) do
      delete :destroy, id: @glass_store_link
    end

    assert_redirected_to glass_store_links_path
  end
end
