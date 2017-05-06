require 'test_helper'

class OsmsControllerTest < ActionController::TestCase
  setup do
    @osm = osms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:osms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create osm" do
    assert_difference('Osm.count') do
      post :create, osm: { custom01: @osm.custom01, custom02: @osm.custom02, custom03: @osm.custom03, custom04: @osm.custom04, custom05: @osm.custom05, custom06: @osm.custom06 }
    end

    assert_redirected_to osm_path(assigns(:osm))
  end

  test "should show osm" do
    get :show, id: @osm
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @osm
    assert_response :success
  end

  test "should update osm" do
    patch :update, id: @osm, osm: { custom01: @osm.custom01, custom02: @osm.custom02, custom03: @osm.custom03, custom04: @osm.custom04, custom05: @osm.custom05, custom06: @osm.custom06 }
    assert_redirected_to osm_path(assigns(:osm))
  end

  test "should destroy osm" do
    assert_difference('Osm.count', -1) do
      delete :destroy, id: @osm
    end

    assert_redirected_to osms_path
  end
end
