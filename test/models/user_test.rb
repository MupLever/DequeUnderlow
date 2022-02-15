require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
  end
  
  test "should new user empty by setup" do
    user = User.new
    assert !user.save
  end

  test "should new and destroy user no empty by setup" do
    assert @user.save
    if @user.save
      assert @user.destroy
    end
  end
end
