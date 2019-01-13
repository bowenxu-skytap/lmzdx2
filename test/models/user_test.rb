require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "bowen", email: "bowen@email.com", password: "123456", password_confirmation: "123456")
  end

  test "setup user should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "password should be present" do
    @user.password = @user.password_confirmation = " " * 8
    assert_not @user.valid?
  end

  test "password should more that 6 characters" do
    @user.password = @user.password_confirmation = "12345"
    assert_not @user.valid?
  end

  test "email addresses should be unique" do
    @user.save
    user2 = @user.dup
    user2.email = @user.email.upcase
    assert_not user2.valid?
  end

end
