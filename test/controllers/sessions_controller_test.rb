require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get session view" do
    get new_session_url
    assert_response :success
    assert_select 'input[name="email"]'
    assert_select 'input[name="password"]'
  end 
end
