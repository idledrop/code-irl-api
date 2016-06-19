require 'test_helper'

class EmailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @email = emails(:one)
  end

  test "should get index" do
    get emails_url
    assert_response :success
  end

  test "should create email" do
    assert_difference('Email.count') do
      post emails_url, params: { email: { email: @email.email, hangout_id: @email.hangout_id } }
    end

    assert_response 201
  end

  test "should show email" do
    get email_url(@email)
    assert_response :success
  end

  test "should update email" do
    patch email_url(@email), params: { email: { email: @email.email, hangout_id: @email.hangout_id } }
    assert_response 200
  end

  test "should destroy email" do
    assert_difference('Email.count', -1) do
      delete email_url(@email)
    end

    assert_response 204
  end
end
