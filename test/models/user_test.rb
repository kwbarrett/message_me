require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(username: 'kwbarrett', password: 'password')
  end
  
  test "should be valid" do
    assert @user.valid?
  end
  
  test "username should be present" do
    @user.username = '     '
    assert_not @user.valid?
  end
  
  test "username should be at least 3 characters" do
    @user.username = 'aa'
    assert_not @user.valid?
  end
  
  test "username should not be too long" do
    @user.username = 'a' * 16
    assert_not @user.valid?
  end
  
  test "username should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end
  
end
