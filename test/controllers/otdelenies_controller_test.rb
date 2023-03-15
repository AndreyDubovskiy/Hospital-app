require "test_helper"

class OtdeleniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @otdeleny = otdelenies(:one)
  end

  test "should get index" do
    get otdelenies_url
    assert_response :success
  end

  test "should get new" do
    get new_otdeleny_url
    assert_response :success
  end

  test "should create otdeleny" do
    assert_difference("Otdeleny.count") do
      post otdelenies_url, params: { otdeleny: {  } }
    end

    assert_redirected_to otdeleny_url(Otdeleny.last)
  end

  test "should show otdeleny" do
    get otdeleny_url(@otdeleny)
    assert_response :success
  end

  test "should get edit" do
    get edit_otdeleny_url(@otdeleny)
    assert_response :success
  end

  test "should update otdeleny" do
    patch otdeleny_url(@otdeleny), params: { otdeleny: {  } }
    assert_redirected_to otdeleny_url(@otdeleny)
  end

  test "should destroy otdeleny" do
    assert_difference("Otdeleny.count", -1) do
      delete otdeleny_url(@otdeleny)
    end

    assert_redirected_to otdelenies_url
  end
end
