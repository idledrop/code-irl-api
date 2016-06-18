require 'test_helper'

class CodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @code = codes(:one)
  end

  test "should get index" do
    get codes_url
    assert_response :success
  end

  test "should create code" do
    assert_difference('Code.count') do
      post codes_url, params: { code: { down: @code.down, up: @code.up, url: @code.url } }
    end

    assert_response 201
  end

  test "should show code" do
    get code_url(@code)
    assert_response :success
  end

  test "should update code" do
    patch code_url(@code), params: { code: { down: @code.down, up: @code.up, url: @code.url } }
    assert_response 200
  end

  test "should destroy code" do
    assert_difference('Code.count', -1) do
      delete code_url(@code)
    end

    assert_response 204
  end
end