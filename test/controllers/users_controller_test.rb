require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new view" do
    get new_user_url
    assert_response :success
    assert_select 'input[name="user[email]"]'
    assert_select 'input[name="user[name]"]'
    assert_select 'input[name="user[password]"]'
    assert_select 'input[name="user[password_confirmation]"]'
  end 
end




