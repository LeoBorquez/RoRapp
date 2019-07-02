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
    assert gunner.followers.include?(one)
    one.unfollow(gunner)
    assert_not one.following?(gunner)
  end

  test "feed have the right posts" do
    one = users(:one)
    gunner = users(:gunner)
    obesidad = users(:obesidad)

    # Posts from followed user
    lana.microposts.each do |post_following|
      assert obesidad.feed.include?(post_following)
    end

    # Post from self
    one.microposts.each do |post_self|
      assert one.feed.include?(post_self)
    end

    # Post from unfollow user
    gunner.microposts.each do |post_unfollowed|
      assert_not one.feed.include?(post_unfollowed)
    end

  end

end
