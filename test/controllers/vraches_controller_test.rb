require "test_helper"

class VrachesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vrach = vraches(:one)
  end

  test "should get index" do
    get vraches_url
    assert_response :success
  end

  test "should get new" do
    get new_vrach_url
    assert_response :success
  end

  test "should create vrach" do
    assert_difference("Vrach.count") do
      post vraches_url, params: { vrach: {  } }
    end

    assert_redirected_to vrach_url(Vrach.last)
  end

  test "should show vrach" do
    get vrach_url(@vrach)
    assert_response :success
  end

  test "should get edit" do
    get edit_vrach_url(@vrach)
    assert_response :success
  end

  test "should update vrach" do
    patch vrach_url(@vrach), params: { vrach: {  } }
    assert_redirected_to vrach_url(@vrach)
  end

  test "should destroy vrach" do
    assert_difference("Vrach.count", -1) do
      delete vrach_url(@vrach)
    end

    assert_redirected_to vraches_url
  end
end
