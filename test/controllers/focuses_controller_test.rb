require 'test_helper'

class FocusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @focus = focuses(:one)
  end

  test "should get index" do
    get focuses_url
    assert_response :success
  end

  test "should create focus" do
    assert_difference('Focus.count') do
      post focuses_url, params: { focus: { name: @focus.name, shortname: @focus.shortname } }
    end

    assert_response 201
  end

  test "should show focus" do
    get focus_url(@focus)
    assert_response :success
  end

  test "should update focus" do
    patch focus_url(@focus), params: { focus: { name: @focus.name, shortname: @focus.shortname } }
    assert_response 200
  end

  test "should destroy focus" do
    assert_difference('Focus.count', -1) do
      delete focus_url(@focus)
    end

    assert_response 204
  end
end
