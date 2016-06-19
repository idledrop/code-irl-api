require 'test_helper'

class HangoutsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hangout = hangouts(:one)
  end

  test "should get index" do
    get hangouts_url
    assert_response :success
  end

  test "should create hangout" do
    assert_difference('Hangout.count') do
      post hangouts_url, params: { hangout: { code_id: @hangout.code_id } }
    end

    assert_response 201
  end

  test "should show hangout" do
    get hangout_url(@hangout)
    assert_response :success
  end

  test "should update hangout" do
    patch hangout_url(@hangout), params: { hangout: { code_id: @hangout.code_id } }
    assert_response 200
  end

  test "should destroy hangout" do
    assert_difference('Hangout.count', -1) do
      delete hangout_url(@hangout)
    end

    assert_response 204
  end
end
