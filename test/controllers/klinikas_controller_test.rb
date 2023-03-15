require "test_helper"

class KlinikasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @klinika = klinikas(:one)
  end

  test "should get index" do
    get klinikas_url
    assert_response :success
  end

  test "should get new" do
    get new_klinika_url
    assert_response :success
  end

  test "should create klinika" do
    assert_difference("Klinika.count") do
      post klinikas_url, params: { klinika: {  } }
    end

    assert_redirected_to klinika_url(Klinika.last)
  end

  test "should show klinika" do
    get klinika_url(@klinika)
    assert_response :success
  end

  test "should get edit" do
    get edit_klinika_url(@klinika)
    assert_response :success
  end

  test "should update klinika" do
    patch klinika_url(@klinika), params: { klinika: {  } }
    assert_redirected_to klinika_url(@klinika)
  end

  test "should destroy klinika" do
    assert_difference("Klinika.count", -1) do
      delete klinika_url(@klinika)
    end

    assert_redirected_to klinikas_url
  end
end
