require 'test_helper'

class AcvsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @acv = acvs(:one)
  end

  test "should get index" do
    get acvs_url
    assert_response :success
  end

  test "should get new" do
    get new_acv_url
    assert_response :success
  end

  test "should create acv" do
    assert_difference('Acv.count') do
      post acvs_url, params: { acv: { gender: @acv.gender, name: @acv.name } }
    end

    assert_redirected_to acv_url(Acv.last)
  end

  test "should show acv" do
    get acv_url(@acv)
    assert_response :success
  end

  test "should get edit" do
    get edit_acv_url(@acv)
    assert_response :success
  end

  test "should update acv" do
    patch acv_url(@acv), params: { acv: { gender: @acv.gender, name: @acv.name } }
    assert_redirected_to acv_url(@acv)
  end

  test "should destroy acv" do
    assert_difference('Acv.count', -1) do
      delete acv_url(@acv)
    end

    assert_redirected_to acvs_url
  end
end
