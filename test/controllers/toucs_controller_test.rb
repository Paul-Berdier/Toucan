require "test_helper"

class ToucsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @touc = toucs(:one)
  end

  test "should get index" do
    get toucs_url
    assert_response :success
  end

  test "should get new" do
    get new_touc_url
    assert_response :success
  end

  test "should create touc" do
    assert_difference('Touc.count') do
      post toucs_url, params: { touc: { touc: @touc.touc } }
    end

    assert_redirected_to touc_url(Touc.last)
  end

  test "should show touc" do
    get touc_url(@touc)
    assert_response :success
  end

  test "should get edit" do
    get edit_touc_url(@touc)
    assert_response :success
  end

  test "should update touc" do
    patch touc_url(@touc), params: { touc: { touc: @touc.touc } }
    assert_redirected_to touc_url(@touc)
  end

  test "should destroy touc" do
    assert_difference('Touc.count', -1) do
      delete touc_url(@touc)
    end

    assert_redirected_to toucs_url
  end
end
