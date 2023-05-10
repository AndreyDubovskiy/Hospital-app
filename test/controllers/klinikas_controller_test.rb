require "test_helper"
class KlinikasControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:one)
    sign_in @user
    @klinika = klinikas(:one)
  end

  test "should get new" do
    get new_klinika_url
    assert_response :success
  end

  test "should create klinika" do
    assert_difference('Klinika.count') do
      post klinikas_path, params: { klinika: { name: "New Klinika", adress: "New Adress" } }
    end

    assert_redirected_to klinika_path(assigns(:klinika))
  end

  test "should show klinika" do
    get klinikas_path, params: { id: @klinika }
    assert_response :success
  end

  test "should get edit" do
    get edit_klinika_path(@klinika), params: { id: @klinika }
    assert_response :success
  end

  test "should update klinika" do
    patch klinika_path(@klinika), params: { id: @klinika, klinika: { name: "New Name" } }
    assert_redirected_to klinika_path(assigns(:klinika))
    @klinika.reload
    assert_equal "New Name", @klinika.name
  end

  test "should destroy klinika" do
    assert_difference('Klinika.count', -1) do
      delete klinika_path(@klinika), params: { id: @klinika }
    end
    assert_redirected_to klinikas_path
  end
end
