require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:two)
  end

  test "redirect edit when user isn't logged in" do
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to admin_login_url
  end

  test "redirect update when user isn't logged in" do
    patch user_path(@user), params: {user: { name: @user.name,
                                             email: @user.email

    }}
    assert_not flash.empty?
    assert_redirected_to admin_login_url
  end

end
