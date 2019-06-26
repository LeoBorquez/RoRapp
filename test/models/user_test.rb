require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
  end

  test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?(:remember, '')
  end

  test "associated microposts should be destroyed" do
    @user.save
    @user.microposts.create!(content: "test test")
    assert_difference 'Micropost.count', -1 do
      @user.destroy
    end
  end

  test "follow and unfollow user" do
    one = users(:one)
    gunner = users(:gunner)

    assert_not one.following?(gunner)
    one.follow(gunner)

    assert one.following?(gunner)
    one.unfollow(gunner)
    assert_not one.following?(gunner)

  end

end
